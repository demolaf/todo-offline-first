import 'dart:developer' as developer;

import 'package:apis/src/apis/local_storage/local_storage.dart';
import 'package:realm/realm.dart';

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl({
    required Realm realm,
  }) : _realm = realm {
    developer.log('Realm db path: ${_realm.config.path}');
  }

  final Realm _realm;

  @override
  Future<void> create<T>(T object) async {
    try {
      await _realm.writeAsync(() {
        _realm.add(object as RealmObject, update: true);
      });
    } catch (e) {
      developer.log('Error creating object');
      rethrow;
    }
  }

  @override
  Future<void> update<T>(void Function() callback) async {
    try {
      await _realm.writeAsync(callback);
    } catch (e) {
      developer.log('Error updating object');
      rethrow;
    }
  }

  @override
  Future<void> delete<T>(T object) async {
    try {
      await _realm.writeAsync(() {
        _realm.delete(object as RealmObject);
      });
    } catch (e) {
      developer.log('Error deleting object');
      rethrow;
    }
  }

  @override
  Future<void> addAll<T extends RealmObject>(Iterable<T> items) async {
    try {
      await _realm.writeAsync(() {
        _realm.addAll<T>(items);
      });
    } catch (e) {
      developer.log('Error adding all objects');
      rethrow;
    }
  }

  @override
  T? findObjectById<T extends RealmObject>(ObjectId id) {
    try {
      return _realm.find<T>(id);
    } catch (e) {
      developer.log('Error looking up object');
      return null;
    }
  }

  @override
  RealmResults<T> read<T extends RealmObject>(
    String query, [
    List<Object?> args = const [],
  ]) {
    try {
      return _realm.query<T>(query, args);
    } catch (e) {
      developer.log('Error fetching object');
      rethrow;
    }
  }

  @override
  RealmResults<T> readAll<T extends RealmObject>() {
    try {
      return _realm.all<T>();
    } catch (e) {
      developer.log('Error fetching all objects');
      rethrow;
    }
  }

  @override
  Stream<RealmResultsChanges<T>> readAsStream<T extends RealmObject>(
    String query, [
    List<Object?> args = const [],
  ]) {
    try {
      return _realm.query<T>(query, args).changes;
    } catch (e) {
      developer.log('Error fetching object as stream');
      rethrow;
    }
  }

  @override
  Stream<RealmResultsChanges<T>> readAllAsStream<T extends RealmObject>() {
    try {
      return _realm.all<T>().changes;
    } catch (e) {
      developer.log('Error fetching all objects as stream');
      rethrow;
    }
  }

  @override
  Future<void> deleteAll<T extends RealmObject>() async {
    try {
      await _realm.writeAsync(() {
        _realm.deleteAll<T>();
      });
    } catch (e) {
      developer.log('Error deleting all objects as stream');
      rethrow;
    }
  }

  @override
  void dispose() {
    _realm.close();
  }
}
