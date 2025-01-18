# Threads Clone with Firebase

![Xcode Version](https://img.shields.io/badge/Xcode-16.0-lightgray?logo=Xcode)
![Devices: iPhone](https://img.shields.io/badge/Devices-iPhone-lightgray)
![Interface: SwiftUI](https://img.shields.io/badge/Interface-SwiftUI-lightgray)
![Architecture: MVVM](https://img.shields.io/badge/Architecture-MVVM-lightgray)

## Project Description
A clone of the Threads application built using SwiftUI, Firebase, and MVVM architecture.

## Features
### User Application
- **Account Management**
  - Create an account using email and password.
  - Sign in with email and password.
- **Feed**
  - View posts from other users.
  - Interact with posts by liking or reposting.
- **Explore**
  - Search for users.
- **Thread Posting**
  - Post threads to your feed.
- **Notifications**
  - View all your notifications.
- **Profile**
  - Display your profile data (name, username, bio, profile image).
  - Edit your profile information.
  - View all threads you have posted.
- **Settings**
  - Log out of your account.
  - View privacy policy and terms of service.

## Demo Video
### Application Demonstration

<img src="https://github.com/feelnomo/Threads-Clone-Firebase/GitDemo/demo.gif" alt="Demo">

## Installation
### To run the Threads Clone on your local machine, follow these steps:

1. **Clone this repository:**
```bash
$ git clone https://github.com/feelnomo/Threads-Clone-Firebase.git
```

2. **Open the project in Xcode:**
   - Open the `Threads Clone Firebase.xcodeproj` file using Xcode.

3. **Install dependencies in Xcode:**
   - Install necessary frameworks such as:
     - `firebase-ios-sdk`
     - `Kingfisher`

4. **Set up Firebase:**
   - Create a Firebase project.
   - Configure Firebase services such as Authentication, Firestore, and Storage.
   - Add the `GoogleService-Info.plist` file to your project.

5. **Run the app:**
   - Build and run the project in Xcode on a simulator or physical device.

## Dependencies
Dependencies are installed using Swift Package Manager:
- [Kingfisher](https://github.com/onevcat/Kingfisher) - for image downloading and caching.
- [Firebase](https://firebase.google.com/) - for backend services such as authentication, database, and storage.
