// ignore_for_file: unused_field
import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';

part 'todo_sync_cubit.freezed.dart';

part 'todo_sync_state.dart';

class TodoSyncCubit extends Cubit<TodoSyncState> {
  TodoSyncCubit({
    required TodoSyncRepository todoSyncRepository,
  })  : _todoSyncRepository = todoSyncRepository,
        super(const TodoSyncState.initial());

  final TodoSyncRepository _todoSyncRepository;
  Timer? _syncTimer;

  /// Syncing remote
  Future<void> synchronizingTodos({required bool connected}) async {
    developer.log('initiating sync timer');

    _todoSyncRepository.listenForPullSync();

    _syncTimer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (connected) {
        final needToSync = _todoSyncRepository.needToPushSync();
        developer.log('checking if sync needed $needToSync');
        if (needToSync && connected) {
          emit(const TodoSyncState.syncing(active: true));
          developer.log('start synchronizing todos');

          await _todoSyncRepository.syncTodosWithRemote();

          emit(const TodoSyncState.syncing(active: false));
          developer.log('done synchronizing todos');
        }
      }
    });
  }

  @override
  Future<void> close() {
    developer.log('cancelling timer');
    _syncTimer?.cancel();
    return super.close();
  }
}
