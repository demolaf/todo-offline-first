import 'package:realm/realm.dart';

abstract class LocalStorage {
  Future<void> create<T>(T object);

  Future<void> update<T>(T object);

  Future<void> delete<T>(T object);

  /// Realm Specific methods
  T? findObjectById<T extends RealmObject>(ObjectId id);

  RealmResults<T> read<T extends RealmObject>({required String query});

  RealmResults<T> readAll<T extends RealmObject>();

  Stream<RealmResultsChanges<T>> readAsStream<T extends RealmObject>({
    required String query,
  });

  Stream<RealmResultsChanges<T>> readAllAsStream<T extends RealmObject>();

  void dispose();
}
