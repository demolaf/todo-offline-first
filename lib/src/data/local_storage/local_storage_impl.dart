import 'dart:developer' as developer;
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';

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
  Future<void> update<T>(T object) async {
    try {
      await _realm.writeAsync(() {
        _realm.add(object as RealmObject, update: true);
      });
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
  T? findObjectById<T extends RealmObject>(ObjectId id) {
    try {
      return _realm.find<T>(id);
    } catch (e) {
      developer.log('Error looking up object');
      return null;
    }
  }

  @override
  RealmResults<T> read<T extends RealmObject>({required String query}) {
    try {
      return _realm.query<T>(query);
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
  Stream<RealmResultsChanges<T>> readAsStream<T extends RealmObject>({
    required String query,
  }) {
    try {
      return _realm.query<T>(query).changes;
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
  void dispose() {
    _realm.close();
  }
}
