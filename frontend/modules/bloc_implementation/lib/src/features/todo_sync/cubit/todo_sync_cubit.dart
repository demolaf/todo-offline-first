// ignore_for_file: unused_field
import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/repositories.dart';

part 'todo_sync_cubit.freezed.dart';

part 'todo_sync_state.dart';

class TodoSyncCubit extends Cubit<TodoSyncState> {
  TodoSyncCubit({
    required TodoSyncRepository todoSyncRepository,
  })  : _todoSyncRepository = todoSyncRepository,
        super(const TodoSyncState.initial());

  final TodoSyncRepository _todoSyncRepository;
  Timer? _syncTimer;

  Future<void> synchronizingTodosWithoutTimer({required bool connected}) async {
    if (connected) {
      developer.log('start synchronizing todos');
      emit(const TodoSyncState.syncing(active: true));

      await _todoSyncRepository.needToPull();

      await _todoSyncRepository.needToPush();

      emit(const TodoSyncState.syncing(active: false));
      developer.log('done synchronizing todos');
    }
  }

  /// Using a timer Syncing remote
  Future<void> synchronizingTodosWithTimer({required bool connected}) async {
    developer.log('initiating sync timer');
    _syncTimer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (connected) {
        developer.log('start synchronizing todos');
        emit(const TodoSyncState.syncing(active: true));

        await _todoSyncRepository.needToPull();

        await _todoSyncRepository.needToPush();

        emit(const TodoSyncState.syncing(active: false));
        developer.log('done synchronizing todos');
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
