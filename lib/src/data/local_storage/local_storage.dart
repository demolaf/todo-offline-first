import 'package:realm/realm.dart';

abstract class LocalStorage {
  Future<void> create<T>(T object);

  Future<void> update<T>(void Function() callback);

  Future<void> delete<T>(T object);

  /// Realm Specific methods
  Future<void> addAll<T extends RealmObject>(Iterable<T> items);

  T? findObjectById<T extends RealmObject>(ObjectId id);

  RealmResults<T> read<T extends RealmObject>(
    String query, [
    List<Object?> args = const [],
  ]);

  RealmResults<T> readAll<T extends RealmObject>();

  Stream<RealmResultsChanges<T>> readAsStream<T extends RealmObject>(
    String query, [
    List<Object?> args = const [],
  ]);

  Stream<RealmResultsChanges<T>> readAllAsStream<T extends RealmObject>();

  Future<void> deleteAll<T extends RealmObject>();

  void dispose();
}
