<!-- # todo_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# TODO App

## Overview
This TODO app allows users to manage their tasks efficiently. The app provides functionalities to add, edit, delete, and fetch tasks from both local storage (SQLite) and a remote server. 

## Design Decisions
- **Local Storage and Synchronization**: Tasks are stored locally using SQLite to ensure they are accessible even when offline. Synchronization with the remote server is performed to keep the data consistent.
- **State Management**: The `ChangeNotifier` class is used to manage the state of the application. This helps in efficiently updating the UI based on the changes in the data.
- **Separation of Concerns**: The app follows the repository pattern to separate the data layer from the presentation layer, making the code more modular and testable.

## Additional Features
- **Animations**: Added animations to enhance the user experience and provide visual feedback on user interactions.
- **Intro Page**: Implemented an introductory page to guide new users through the features of the app.
- **Unit Testing**: Used the `mockito` package for unit testing to ensure the reliability of the app’s core functionalities. Tests cover CRUD operations, input validation, state management, and network requests.
  
## Challenges Faced
- **Data Synchronization**: Ensuring data consistency between local storage and the remote server required careful handling of asynchronous operations and potential conflicts.
- **Error Handling**: Implementing robust error handling to provide meaningful feedback to the user in case of network failures or other issues.
- **State Management**: Managing the state of the application efficiently to ensure smooth and responsive user interactions, especially when handling paginated data.

## Technologies Used
- **Flutter**: For building the cross-platform mobile application.
- **SQLite**: For local data storage.
- **Dio**: For making network requests.
- **mockito**: For unit testing.
- **Provider**: For state management.

## Conclusion
The TODO app meets all the requirements and includes additional features to enhance user experience and ensure reliability through comprehensive testing.
