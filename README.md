![gif-4](https://github.com/demolaf/todo-offline-first/assets/48495111/798eb4a4-726b-433d-aaee-5f43611a5a51)# Todo Sync (Offline-first) App

[![HitCount](https://hits.dwyl.com/demolaf/todo-offline-first.svg?style=flat-square&show=unique)](http://hits.dwyl.com/demolaf/todo-offline-first)

An Offline-first approach Todo App using Realm and Firebase.

### Content

* [Running the App](#running-the-app)
* [Previews](#previews)
* [App Architecture & Folder Structure](#app-architecture-and-folder-structure)

## Running the App

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
![gif-2](https://github.com/demolaf/todo-offline-first/assets/48495111/6a427dea-2caa-4bac-bc5e-746185aa6c84)
![gif-3](https://github.com/demolaf/todo-offline-first/assets/48495111/72d47235-b28f-4b6e-8b3f-f18708c2b5a0)
![gif-4](https://github.com/demolaf/todo-offline-first/assets/48495111/69901c14-80c9-4bb1-836a-2d92187e0e35)
![gif-5](https://github.com/demolaf/todo-offline-first/assets/48495111/967f23b9-705e-40f3-a8f2-cdbab90ddd10)
![gif-6](https://github.com/demolaf/todo-offline-first/assets/48495111/76706468-c07c-4ec2-921b-3605f2961131)

<p align="center">
<img src="readMeAssets/ss-1.png" width="200"/>
<img src="readMeAssets/ss-2.png" width="200"/>
<img src="readMeAssets/ss-3.png" width="200"/>
<img src="readMeAssets/ss-4.png" width="200"/>
</p>

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
