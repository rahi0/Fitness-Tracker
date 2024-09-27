# Fitness Tracker

## Overview 
The Fitness Tracker app allows users to record, manage, and persist their workout sessions, enabling easy tracking of exercise routines. Users can add, edit, and delete workouts, ensuring they have a comprehensive view of their fitness journey.


## Features 
- Workout Recording: Users can add new workouts, including exercise type, weight, and reps, via a user-friendly dialog.
- Workout List View: Displays all recorded workout sessions with dynamic exercise details.
- Edit and Delete Workouts: Allows users to select, modify, or delete workout entries. They can also add/remove sets or change set details.
- Persistent Storage: Saves all workout data using SharedPreferences, ensuring the information is retained after closing the app.
- Workout Session Management: Users can complete and save workout sessions, edit or delete past sessions, and easily manage workout histories.
- Navigation: Smooth navigation through bottom navigation bar to switch between screens without losing data.
- Swipe to Delete: Users can swipe left to right on an entry to delete it.



## Technologies Used 
The flutter app employs the MVC (Model-View-Controller) architecture for clear separation of concerns, enhancing maintainability and scalability. Third-party packages used include:
* GetX: Simplifies state management and dependency injection.
* SharedPreferences: Provides persistent storage for user data.
* Timezone: Manages time-related functionalities.
* Intl: Facilitates internationalization.
* Google Fonts: Allows for custom font usage in the app.


## Functionality 
- Workout Session Saving: Workouts are added via a dialog, and sessions are saved to SharedPreferences. Users can edit saved sessions or delete them when necessary.
- State Management with GetX: GetX is used to manage the state of workouts. It ensures reactive updates to the UI, enabling seamless data updates across the app without the need for excessive use of setState().
