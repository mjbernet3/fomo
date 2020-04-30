const functions = require('firebase-functions');
const algoliasearch = require('algoliasearch');

const ALGOLIA_ID = functions.config().algolia.app_id;
const ALGOLIA_ADMIN_KEY = functions.config().algolia.api_key;

const algoliaClient = algoliasearch(ALGOLIA_ID, ALGOLIA_ADMIN_KEY);

const addToEventIndex = require('./lib/algolia/addToEventIndex');
const updateEventIndex = require('./lib/algolia/updateEventIndex');
const deleteFromEventIndex = require('./lib/algolia/deleteFromEventIndex');

/*
    Algolia Functions
*/
exports.addToEventIndex = functions.firestore.document('events/{eventId}').onCreate(snapshot => {
    return addToEventIndex.handler(snapshot, algoliaClient);
});

exports.updateEventIndex = functions.firestore.document('events/{eventId}').onUpdate(change => {
    return updateEventIndex.handler(change, algoliaClient);
});

exports.deleteFromEventIndex = functions.firestore.document('events/{eventId}').onDelete(snapshot => {
    return deleteFromEventIndex.handler(snapshot, algoliaClient);
});