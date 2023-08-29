### An Offline-first approach Todo App using Realm and Firebase.
[![HitCount](https://hits.dwyl.com/demolaf/todo-offline-first.svg?style=flat-square&show=unique)](http://hits.dwyl.com/demolaf/todo-offline-first)

### Content

* [Running the App](#running-the-app)
* [Previews](#previews)
* [App Architecture & Folder Structure](#app-architecture-and-folder-structure)

## Running the App

### Setting up Firebase

Use this to get started with setting up [Firebase](https://firebase.google.com/docs/flutter/setup?platform=ios)

### Environment Config
This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

---
## Previews

![gif-1](https://github.com/demolaf/todo-offline-first/assets/48495111/4c166ab9-9329-4f40-a854-d2ae72b0d066)

## App Architecture and Folder Structure

#### Folder Structure

```
lib 
 ├── src
    ├── app
    │   └── view
    ├── core
    │   ├── constants
    │   ├── enums
    │   ├── extensions
    │   ├── shared
    │   │   └── ui_kit
    │   ├── utils
    ├── data
    │   ├── api
    │   ├── local_storage
    │   ├── models
    │   ├── repositories
    │   ├── utils
    ├── l10n
    ├── modules
    │   ├── connection_checker
    │   ├── create_todo
    │   ├── home
    │   ├── landing_loading
    │   ├── settings
    │   ├── sign_in
    │   ├── todo_sync
    ├── firebase.options.dart
    ├── main_development.dart
    ├── main_production.dart
    ├── main_staging.dart
    └── bootstrap.dart
```

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---
