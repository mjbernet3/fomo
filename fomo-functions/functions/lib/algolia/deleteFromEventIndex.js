exports.handler = function(snapshot, algoliaClient) {
    const eventIndex = algoliaClient.initIndex('events');

    return eventIndex.deleteObject(snapshot.id);
}