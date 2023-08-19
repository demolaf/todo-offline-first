import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:realm/realm.dart' as realm_flutter;
import 'package:todo_bloc/bootstrap.dart';
import 'package:todo_bloc/firebase_options.dart';
import 'package:todo_bloc/src/app/app.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/models/dtos/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/models/dtos/user/user_dto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Configure local storage using realm
  final config = realm_flutter.Configuration.local(
    [TodoDTO.schema, UserDTO.schema, QueueDTO.schema],
  );
  final realm = realm_flutter.Realm(config);

  /// Configure internet connection checker
  final internetConnectionInstance = InternetConnection.createInstance();

  await bootstrap(
    () => App(
      realm: realm,
      internetConnection: internetConnectionInstance,
    ),
  );
}
