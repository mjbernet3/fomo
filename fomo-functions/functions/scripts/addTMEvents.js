const axios = require('axios');
const admin = require('firebase-admin');
const serviceAccount = require("../serviceAccountKey.json");
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://fomo-d20a9.firebaseio.com",
});

const db = admin.firestore();

// Add API key to URL for testing
async function getTMEvents() {
    const uri = 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&dmaId=220&apikey=';
    var response = await axios.get(uri);
    var events = response.data['_embedded']['events'];
    var parsedEvents = []
    for (var i=0; i < events.length; i++) {
        let event = parseTMEvent(events[i]);
        parsedEvents.push(event);
    }
    return parsedEvents;
}

function parseTMEvent(event) {
    return {
        address: event['_embedded']['venues'][0]['address']['line1'],
        dateTime: event['dates']['start']['dateTime'],
        name: event['name'],
        imageUrl: event['images'][0]['url'],
        location: {
            latitude: event['_embedded']['venues'][0]['location']['latitude'],
            longitude: event['_embedded']['venues'][0]['location']['longitude'],
        },
        ticketUrl: event['url'],
        venueName: event['_embedded']['venues'][0]['name'],
        description: event['description'] ? event['description'] : null,
        genre: event['classifications'][0]['genre']['name'],
        subGenre: event['classifications'][0]['subGenre']['name'],
        usersGoing: [],
        usersInterested: [],
    }
}

async function addTMEventsToCollection(collection) {
    var events = await getTMEvents();
    events.forEach((event) => {
        db.collection(collection).add(event);
    });
}

addTMEventsToCollection("events");