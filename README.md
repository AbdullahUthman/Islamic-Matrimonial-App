# Islamic Matrimonial App

An Islamic matrimonial app built in Flutter. The motivation behind the app is to provide a halal platform for people seeking marriage ("Rishta") while avoiding free mixing between genders and any haram environment.

## About the Project

This project was built as a Flutter portfolio application to demonstrate UI development, filtering logic, and basic application structure. The goal was to create a halal matrimonial platform where users can browse profiles while staying within Shariah guidelines.

## Features

- Gender-based profile browsing (male users see female profiles and vice versa)
- Shortlisting profiles with swipe-to-remove functionality
- Filtering profiles by city, age range, marital status, and children

## Tech Stack

- Flutter
- Dart

## Project Structure
```
lib/
├── data/
│   ├── female_dummy_data.dart
│   └── male_dummy_data.dart
├── models/
│   ├── filter.dart
│   ├── profile.dart
│   └── user.dart
├── screens/
│   ├── cities_screen.dart
│   ├── female_filters_screen.dart
│   ├── male_filters_screen.dart
│   ├── main_screen.dart
│   ├── login_screen.dart
│   ├── profile_screen.dart
│   ├── profiles_screen.dart
│   └── shortlist_screen.dart
├── widgets/
│   ├── age_slider.dart
│   ├── city_card.dart
│   ├── contact_button.dart
│   ├── profile_card.dart
│   └── shortlist_button.dart
└── main.dart
```

## Screens

### Login Screen
<img width="300" src="https://github.com/user-attachments/assets/06d38405-6bc9-45d4-b777-0970e1f2f8e2">

### Cities Screen
<img width="300" src="https://github.com/user-attachments/assets/afc8957e-6ac6-4cc0-9ae8-0741c67ca037">

### Drawer
<img width="300" src="https://github.com/user-attachments/assets/65af0563-eac0-4962-bc2d-2647ef2428e3">

### Filters
<img width="300" src="https://github.com/user-attachments/assets/973773c5-c1e2-49f4-9250-5b24f8f528f4">

### Profiles Screen
<img width="300" src="https://github.com/user-attachments/assets/58c1f531-fa2b-4721-a3c1-ed22365c826b">

### Profile Screen
<p>
  <img src="https://github.com/user-attachments/assets/c7410745-2e06-465b-8d5c-9a72c1df9fcd" width="250">
  <img src="https://github.com/user-attachments/assets/3f172045-f0dd-49f9-bfa7-c08a9e306ffb" width="250">
</p>

### Shortlist Screen
<img width="300" src="https://github.com/user-attachments/assets/3d8607bd-30ce-4c56-b582-491c0c7dba41">

## Limitations

- No backend database (relies on hardcoded dummy data)
- Direct calling functionality is planned but not yet implemented
- No state management

## How to Run

### Prerequisites

Make sure you have the following installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Android Studio or VS Code with Flutter/Dart extensions
- An Android emulator or a physical device

Verify your Flutter installation:
```bash
flutter doctor
```

### Steps

1. Clone the repository:
```bash
git clone https://github.com/abdullahuthman/islamic_matrimonial_app.git
```

2. Navigate into the project directory:
```bash
cd islamic_matrimonial_app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```
