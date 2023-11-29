import 'package:apis/apis.dart';
import 'package:bloc_implementation/bloc_implementation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:realm/realm.dart' as realm_flutter;
import 'package:todo_bloc/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: false);

  /// Configure local storage using realm
  final config = realm_flutter.Configuration.local(
    [TodoDTO.schema, UserDTO.schema, QueueDTO.schema],
  );
  final realm = realm_flutter.Realm(config);

  /// Configure internet connection checker
  final internetConnectionInstance = InternetConnection.createInstance();

  await runBlocApp(
    realm: realm,
    internetConnection: internetConnectionInstance,
  );
}
