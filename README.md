# Project Fomo
**Atlanta Arts Initiative App**  
JIA - 9340  
Release Notes  
Updated: April 20th, 2020  

## Release Notes

### FOMO v1.0
April 20th, 2020
#### New Software Features
- Added a Welcome page to greet users and prompt them to login or register a brand new account
- Added Registration page where users can create a brand new account
- Added Login page where users can log into an existing account
- Added a Forgot Password button so that users who forget their password may recover their account
- Added Discover page to allow users to scroll through and explore events by category previews
- Added View All Events page to allow users to view all events in a given category
- Added Event Clicked page, allowing users to tap events and see all details of the event such as date, time, genre and location
- Added ‘Interested’ and ‘Going’ buttons to the Event Clicked page so that users can indicate their status on any given event
- Added Ticket link to Event Clicked page so that users can be directed a page where they can buy tickets
- Added Directions link to Event Clicked Page so that user can be directed to Google maps for directions to the event’s venue
- Added Search page to allow users to search by keyword for specific artists or events
- Added Genre buttons to the search page to allow users to do a quick-search for events by genre
- Added My Events page so that users can store and view events they are interested in or going to
- Added ‘Interested’ and ‘Going’ categories in the My Events page so that users can sort their saved events by category
- Added a Profile Page for the user to view and manage their personal information
- Added a display of the user’s name, username, and profile picture.
- Added the ability for a user to be able to change their profile picture
- Added sliders for account settings, such as Notifications and Location Services
- Added a Friends slider to the Profile page in which a user can view a preview of their friend’s list
- Added a Friends List page accessible by the Friends slider, allowing users to view their entire friends list
- Added a link to an Account page to the Profile page where users can go to change their name, username, or email associated with their account
- Added a link to an About page to the Profile page, where users will go to view relevant app information
- Added a Sign Out button to the Profile page, bringing users back to the Welcome page

#### Bug Fixes
- Fixed a bug creating overflow on input fields in Login and Registration pages
- Fixed a bug creating renderflex errors on the Event Clicked and View All Events pages
- Improved load time of genre images on the search page
- Fixed a bug in which date/time fields were not appearing properly on event cards on the discover and view all pages
- Fixed a bug in which images were not scaling properly to event cards
- Fixed a bug in which images were not fitting properly to the top of the event clicked page
- Fixed a bug that caused erroneous loading of events at the bottom of the view all page
- Fixed a bug in which removing events from interested and going in Firebase resulted in data corruption


#### Known Bugs or Remaining Implementations
- Adding Friends is not currently supported on the frontend, there is a backend method but the interface to add friends has not yet been created
- Backend functionality for Notifications or Location Services sliders in settings has not yet been implemented
- If an account on your friends list is deleted, it will still show up on your friends list and friends scroller in the form of an infinite loading symbol
- Friends Category not yet added to Discover page



## Install Guide
### Pre-Requisites
You must have the following installed and configured before proceeding, see provided links for more information:
- Android Studio and Android SDK (https://developer.android.com/studio)
- Android Studio Emulator
- XCode and iOS SDK (mac only: https://apps.apple.com/us/app/xcode/id497799835?mt=12)
- iOS Device Simulator (mac only)
- Flutter SDK (https://flutter.dev/docs/get-started/install)
- Dart SDK (https://dart.dev/get-dart)

### Dependent Libraries
Download and install the following:
- Google Services Firestore Configuration File for Android/iOS  
  
The following libraries are also required:  
- provider
- rxdart
- firebase core
- cloud firestore
- algolia
- firebase auth
- carousel slider
- cupertino icons
- firebase storage
- image cropper
- image picker
- url launcher

To get these dependencies open a terminal window and navigate to the repository and run the following command:  
	flutter pub get

### Download
Clone https://github.com/mjbernet3/fomo.git

### Build Instructions
Open an emulator using Android Studio or XCode or through the command line using the following command:  
	emulator -avd avd_name [ {-option [value]} …].  
To view a list of AVD names, enter the following command:  
	emulator -list-avds  
  
For more information on opening the emulator through Android Studio or XCode visit the following links:  
	Android Studio (https://developer.android.com/studio/run/emulator)  
	XCode
(https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/iOS_Simulator_Guide/GettingStartedwithiOSSimulator/GettingStartedwithiOSSimulator.html)  

Then open the terminal window and navigate to the repository and run the following command:  
	flutter run  

### Installation
Clone the repository using the provided github link above.

### Run Instructions
Use the emulator to interact with the application.  
  
Most clean clones of the app require fetching flutter and dart dependencies. Run:  
	flutter package get

### Troubleshooting
If your flutter install becomes corrupted, run the following commands in your flutter install directory:  
	git clean -xfd  
	git stash save --keep-index  
	git stash drop  
	git pull  
	flutter doctor  
  
If running ‘flutter run’ returns “command: flutter not found”:  
	Ensure that your path is correctly configured.  
	For more information, visit the following links:  
		For Mac: https://flutter.dev/docs/get-started/install/macos  
		For Windows: https://flutter.dev/docs/get-started/install/windows  
		For Linux: https://flutter.dev/docs/get-started/install/linux  
  
If your pub dependencies become corrupted, run the following command:  
	pub cache repair  
  
If hot reload is not working:  
Set your environment variable NO_PROXY=127.0.0.1  
  
If missing flutter dependencies, run the following command:  
flutter doctor  
