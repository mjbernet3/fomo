exports.handler = function(snapshot, algoliaClient) {
    const data = snapshot.data();
    const objectID = snapshot.id;

    const eventIndex = algoliaClient.initIndex('events');

    return eventIndex.saveObject({
        objectID: objectID,
        address: data.address,
        dateTime: data.dateTime,
        name: data.name,
        imageUrl: data.imageUrl,
        location: data.location,
        ticketUrl: data.ticketUrl,
        venueName: data.venueName,
        description: data.description,
        genre: data.genre,
        subGenre: data.subGenre,
    });
}