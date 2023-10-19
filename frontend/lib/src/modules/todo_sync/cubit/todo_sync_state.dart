part of 'todo_sync_cubit.dart';

@freezed
class TodoSyncState with _$TodoSyncState {
  const factory TodoSyncState.initial() = _TodoSyncStateInitial;

  const factory TodoSyncState.loading() = TodoSyncStateLoading;

  const factory TodoSyncState.syncing({required bool active}) =
      TodoSyncStateSyncing;
}
