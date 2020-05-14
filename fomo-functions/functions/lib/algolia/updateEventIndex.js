exports.handler = function(change, algoliaClient) {
    const updatedData = change.after.data();
    const objectID = change.after.id;

    const eventIndex = algoliaClient.initIndex('events');

    return eventIndex.saveObject({
        objectID: objectID,
        address: updatedData.address,
        dateTime: updatedData.dateTime,
        name: updatedData.name,
        imageUrl: updatedData.imageUrl,
        location: updatedData.location,
        ticketUrl: updatedData.ticketUrl,
        venueName: updatedData.venueName,
        description: updatedData.description,
        genre: updatedData.genre,
        subGenre: updatedData.subGenre,
    });
}