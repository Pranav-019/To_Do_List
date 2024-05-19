# TodoList iOS App

Welcome to the TodoList iOS App! This app helps users manage their tasks efficiently by creating, viewing, and deleting to-do items. It leverages Firebase for backend services and provides user authentication via email and password.

## Features

- **User Authentication**: Secure sign-up and login using email and password.
- **To-Do Management**: Create, view, and delete to-do items.
- **Firebase Integration**: Real-time database for storing and retrieving tasks.

## Requirements

- iOS 13.0+
- Xcode 11.0+
- Swift 5.0+
- CocoaPods

## Getting Started

### Prerequisites

Make sure you have the following installed on your system:

- Xcode
- CocoaPods

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/todolist-ios-app.git
   cd todolist-ios-app
   ```

2. **Install dependencies**:

   ```bash
   pod install
   ```

3. **Open the project in Xcode**:

   ```bash
   open TodoList.xcworkspace
   ```

4. **Firebase Setup**:

   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new project or use an existing one.
   - Add an iOS app to your Firebase project and follow the steps to download the `GoogleService-Info.plist` file.
   - Place the `GoogleService-Info.plist` file in the root of your Xcode project.

5. **Configure Firebase in the app**:

   In `AppDelegate.swift`, ensure Firebase is configured:

   ```swift
   import Firebase

   @UIApplicationMain
   class AppDelegate: UIResponder, UIApplicationDelegate {
       var window: UIWindow?

       func application(_ application: UIApplication,
                        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           FirebaseApp.configure()
           return true
       }
   }
   ```

## Usage

### User Authentication

- **Sign Up**: Users can sign up with their email and password.
- **Login**: Users can log in with their email and password.
- **Logout**: Users can log out from the app.

### To-Do Management

- **Create To-Do**: Add a new to-do item.
- **View To-Dos**: View all existing to-do items.
- **Delete To-Do**: Delete a to-do item.

## Project Structure

- `AppDelegate.swift`: Configures Firebase.
- `ViewController.swift`: Handles user authentication and to-do operations.
- `Todo.swift`: Model for to-do items.
- `TodoService.swift`: Service layer to interact with Firebase.

## Contributing

We welcome contributions to enhance the TodoList app. To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Firebase](https://firebase.google.com/) for backend services.
- [CocoaPods](https://cocoapods.org/) for dependency management.

---

Thank you for using TodoList iOS App! If you have any questions or feedback, please feel free to contact us.
