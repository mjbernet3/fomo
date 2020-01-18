"""
Run this file to upload every music event in TicketMaster's database.
The API response object is indexed via hard coding which leads to some KeyError bugs.
This script only has basic error handling when working with TM's API.
Input a valid TicketMaster API key as an argument: python3 uploadTMEvents [API KEY].
Remember to have a ServiceAccountKey.json file placed in this directory to connect with firestore.

All documents are given a random UUID and placed in the "events" collection.
"""

import requests
import uuid
import time
import sys

import firebase_admin
from firebase_admin import credentials, firestore

# authenticate to firestore
cred = credentials.Certificate('ServiceAccountKey.json')
default_app = firebase_admin.initialize_app(cred)
db = firestore.client()

if len(sys.argv) < 2:
    print("You must provide a TicketMaster API Key")
    sys.exit()

TM_APIKEY = sys.argv[1]

# Calls the TicketMaster API for musical events in the given dmaId (location)
def getTMEvents(dmaId):
    URL = 'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&dmaId={}&apikey={}'.format(dmaId, TM_APIKEY)
    response = requests.get(URL)
    print("status code: {}".format(response.status_code))
    if (response.status_code != 200):
        raise Exception(response.json())

    if (response.json()['page']['totalElements'] == 0):
        return None

    content = response.json()['_embedded']['events']
    return [
            { 'eventName': e['name'],
            'venueName': e['_embedded']['venues'][0]['name'],
            'address': e['_embedded']['venues'][0]['address']['line1'],
            'location': { "latitude": e['_embedded']['venues'][0]['location']['latitude'], 'longitude': e['_embedded']['venues'][0]['location']['longitude'] },
            'date': e['dates']['start']['localDate']
                if 'localDate' in e['dates']['start'].keys()
                else 'TBD',
            'time': e['dates']['start']['localTime']
                if 'localTime' in e['dates']['start'].keys()
                else 'TBD',
            'genre': [ e['classifications'][0]['genre'], e['classifications'][0]['subGenre'] ]
                if ('subGenre' in e['classifications'][0].keys())
                else [ e['classifications'][0]['genre'] ],
            'image': e['images'][0]['url'],
            'url': e['url'] }
            for e in content]


# Uploads a locations TicketMaster music events to firestore
def uploadEventsByDMA(dmaId):
    events = getTMEvents(dmaId)
    if events == None:
        return

    for event in events:
        id = str(uuid.uuid1()) # generate a random uuid for the document
        doc_ref = db.collection('events').document(id)
        doc_ref.set(event)


if __name__ == '__main__':
    # loop through all dmaIds (200 - 903) and upload music events from each area to firestore
    for dma in range(200, 904):
        uploadEventsByDMA(dma)
        time.sleep(.2) # slows down calls to prevent TicketMaster API errors