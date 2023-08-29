// ignore_for_file: type=lint
// ignore_for_file: unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/api/queue/local_queue_api.dart';
import 'package:todo_bloc/src/data/api/queue/remote_queue_api.dart';
import 'package:todo_bloc/src/data/api/todo/local_todo_api.dart';
import 'package:todo_bloc/src/data/api/todo/remote_todo_api.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/models/dtos/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository_impl.dart';

class MockTodoDTO extends Mock implements TodoDTO {}

class MockQueueDTO extends Mock implements QueueDTO {}

class MockLocalStorage extends Mock implements LocalStorage {}

class MockRemoteQueueApi extends Mock implements RemoteQueueApi {}

class MockLocalQueueApi extends Mock implements LocalQueueApi {}

class MockLocalTodoApi extends Mock implements LocalTodoApi {}

class MockRemoteTodoApi extends Mock implements RemoteTodoApi {}

void main() {
  late MockRemoteTodoApi remoteTodoApi;
  late MockLocalTodoApi localTodoApi;
  late MockRemoteQueueApi remoteQueueApi;
  late MockLocalQueueApi localQueueApi;
  late MockQueueDTO queue;
  late MockTodoDTO todo;
  late TodoSyncRepositoryImpl sut;

  setUpAll(() {
    registerFallbackValue(MockTodoDTO());
    registerFallbackValue(MockQueueDTO());
  });

  setUp(() {
    remoteQueueApi = MockRemoteQueueApi();
    localQueueApi = MockLocalQueueApi();
    remoteTodoApi = MockRemoteTodoApi();
    localTodoApi = MockLocalTodoApi();

    queue = MockQueueDTO();
    todo = MockTodoDTO();

    sut = TodoSyncRepositoryImpl(
      localQueueApi: localQueueApi,
      localTodoApi: localTodoApi,
      remoteQueueApi: remoteQueueApi,
      remoteTodoApi: remoteTodoApi,
    );
  });

  group('when storeQueueToSync is called', () {
    setUp(() {});

    tearDown(() {
      verifyNoMoreInteractions(localQueueApi);
    });

    test(
      'if queue operation is create',
      () async {
        when(() => queue.operationType)
            .thenReturn(QueueOperationType.create.name);
        when(() => localQueueApi.createQueue(any())).thenAnswer((_) async {});

        await sut.createQueueForTodo(
          operationType: QueueOperationType.create,
          id: '',
        );

        verify(() => localQueueApi.createQueue(any())).called(1);
      },
    );

    test(
      'if queue operation is delete and queue is synced, '
      'then create a new queue',
      () async {
        when(() => queue.operationType)
            .thenReturn(QueueOperationType.delete.name);
        when(() => localQueueApi.checkAndRemoveExistingUnsyncedQueue(
            operationType: QueueOperationType.delete,
            todoId: any(named: 'todoId'))).thenAnswer((_) async => false);
        when(() => localQueueApi.createQueue(any())).thenAnswer((_) async {});

        await sut.createQueueForTodo(
          operationType: QueueOperationType.delete,
          id: '',
        );

        verify(() => localQueueApi.checkAndRemoveExistingUnsyncedQueue(
            operationType: QueueOperationType.delete, todoId: '')).called(1);
        verify(() => localQueueApi.createQueue(any())).called(1);
      },
    );

    test(
      'if queue operation is delete and unsynced, then delete unsynced queue '
      'and return',
      () async {
        when(() => queue.operationType)
            .thenReturn(QueueOperationType.delete.name);
        when(() => localQueueApi.checkAndRemoveExistingUnsyncedQueue(
            operationType: QueueOperationType.delete,
            todoId: '')).thenAnswer((_) async => true);

        await sut.createQueueForTodo(
          operationType: QueueOperationType.delete,
          id: '',
        );

        verify(() => localQueueApi.checkAndRemoveExistingUnsyncedQueue(
            operationType: QueueOperationType.delete, todoId: '')).called(1);
      },
    );
  });

  group('when pushUnSyncedQueuesAndTodosToRemote is called', () {
    setUp(() {
      when(() => queue.id)
          .thenReturn(ObjectId.fromHexString('64d0f9f22912c96e042d4fb7'));
      when(() => queue.todoId).thenReturn('64d0f9f22912c96e042d4fb6');
      when(() => queue.createdAt).thenReturn('');

      when(() => todo.id)
          .thenReturn(ObjectId.fromHexString('64d0f9f22912c96e042d4fb6'));
      when(() => todo.color).thenReturn('');
      when(() => todo.lastModifiedAt).thenReturn('');
      when(() => todo.time).thenReturn('');
      when(() => todo.priority).thenReturn('');
      when(() => todo.description).thenReturn('');
      when(() => todo.title).thenReturn('');
      when(() => todo.completed).thenReturn(false);
      when(() => todo.synced).thenReturn(false);
    });

    tearDown(() {
      verifyNoMoreInteractions(localQueueApi);
      verifyNoMoreInteractions(localTodoApi);
      verifyNoMoreInteractions(remoteQueueApi);
      verifyNoMoreInteractions(remoteTodoApi);
    });

    test('if no unsynced queues then return', () async {
      when(() => localQueueApi.fetchUnSyncedQueues()).thenReturn([]);

      await sut.needToPush();

      verify(() => localQueueApi.fetchUnSyncedQueues()).called(1);
    });

    test('if queue operation is create', () async {
      when(() => localQueueApi.fetchUnSyncedQueues()).thenReturn([queue]);
      when(() => queue.operationType)
          .thenReturn(QueueOperationType.create.name);
      when(() => localTodoApi.getTodo(any())).thenAnswer((_) async => todo);
      when(() => todo.synced).thenReturn(true);
      when(() => remoteTodoApi.createTodo(any())).thenAnswer((_) async => {});
      when(() => remoteQueueApi.createQueue(any())).thenAnswer((_) async => {});
      when(() => localQueueApi.updateQueue(any()))
          .thenAnswer((invocation) async => () {});
      when(() => localTodoApi.updateTodoLocal(any()))
          .thenAnswer((_) async => {});

      await sut.needToPush();

      verify(() => localQueueApi.fetchUnSyncedQueues()).called(1);
      verify(() => localTodoApi.getTodo(any())).called(1);
      verify(() => remoteTodoApi.createTodo(any())).called(1);
      verify(() => remoteQueueApi.createQueue(any())).called(1);
      verify(() => localQueueApi.updateQueue(any())).called(1);
      verify(() => localTodoApi.updateTodoLocal(any())).called(1);
    });

    test('if queue operation is update', () async {
      when(() => localQueueApi.fetchUnSyncedQueues()).thenReturn([queue]);
      when(() => queue.operationType)
          .thenReturn(QueueOperationType.update.name);
      when(() => localTodoApi.getTodo(any())).thenAnswer((_) async => todo);
      when(() => remoteTodoApi.updateTodo(any())).thenAnswer((_) async => {});
      when(() => remoteQueueApi.createQueue(any())).thenAnswer((_) async => {});
      when(() => localQueueApi.updateQueue(any()))
          .thenAnswer((invocation) async => () {});
      when(() => localTodoApi.updateTodoLocal(any()))
          .thenAnswer((_) async => {});

      await sut.needToPush();

      verify(() => localQueueApi.fetchUnSyncedQueues()).called(1);
      verify(() => localTodoApi.getTodo(any())).called(1);
      verify(() => remoteTodoApi.updateTodo(any())).called(1);
      verify(() => remoteQueueApi.createQueue(any())).called(1);
      verify(() => localQueueApi.updateQueue(any())).called(1);
      verify(() => localTodoApi.updateTodoLocal(any())).called(1);
    });

    test('if queue operation is delete', () async {
      when(() => localQueueApi.fetchUnSyncedQueues()).thenReturn([queue]);
      when(() => queue.operationType)
          .thenReturn(QueueOperationType.delete.name);
      when(() => remoteTodoApi.deleteTodo(any())).thenAnswer((_) async => {});
      when(() => remoteQueueApi.createQueue(any())).thenAnswer((_) async => {});
      when(() => localQueueApi.updateQueue(any()))
          .thenAnswer((invocation) async => () {});

      await sut.needToPush();

      verify(() => localQueueApi.fetchUnSyncedQueues()).called(1);
      verify(() => remoteTodoApi.deleteTodo(any())).called(1);
      verify(() => remoteQueueApi.createQueue(any())).called(1);
      verify(() => localQueueApi.updateQueue(any())).called(1);
    });
  });

  group('when pullQueuesAndTodosFromRemote is called', () {
    setUp(() {
      when(() => queue.id)
          .thenReturn(ObjectId.fromHexString('64d0f9f22912c96e042d4fb7'));
      when(() => queue.todoId).thenReturn('64d0f9f22912c96e042d4fb6');
      when(() => queue.createdAt).thenReturn('');

      when(() => todo.id)
          .thenReturn(ObjectId.fromHexString('64d0f9f22912c96e042d4fb6'));
      when(() => todo.color).thenReturn('');
      when(() => todo.time).thenReturn('');
      when(() => todo.priority).thenReturn('');
      when(() => todo.description).thenReturn('');
      when(() => todo.title).thenReturn('');
      when(() => todo.completed).thenReturn(false);
      when(() => todo.synced).thenReturn(false);
      when(() => todo.lastModifiedAt).thenReturn(
          DateTime.parse('2023-08-28T21:57:43.627175').toIso8601String());
    });

    tearDown(() {
      verifyNoMoreInteractions(localQueueApi);
      verifyNoMoreInteractions(localTodoApi);
      verifyNoMoreInteractions(remoteQueueApi);
      verifyNoMoreInteractions(remoteTodoApi);
    });

    test('if no queues in remote then return', () async {
      when(() => remoteQueueApi.getQueues()).thenAnswer((_) async => []);

      await sut.needToPull();

      verify(() => remoteQueueApi.getQueues()).called(1);
    });

    test('if queue operation is create', () async {
      when(() => queue.operationType)
          .thenReturn(QueueOperationType.create.name);
      when(() => remoteQueueApi.getQueues()).thenAnswer((_) async => [queue]);
      when(() => localQueueApi.getQueues()).thenAnswer((_) async => []);
      when(() => remoteTodoApi.getTodo(any())).thenAnswer((_) async => todo);
      when(() => localTodoApi.createTodo(any())).thenAnswer((_) async => todo);
      when(() => localQueueApi.createQueue(any()))
          .thenAnswer((_) async => queue);

      await sut.needToPull();

      verify(() => remoteQueueApi.getQueues()).called(1);
      verify(() => localQueueApi.getQueues()).called(1);
      verify(() => remoteTodoApi.getTodo(any())).called(1);
      verify(() => localTodoApi.createTodo(any())).called(1);
      verify(() => localQueueApi.createQueue(any())).called(1);
    });

    // test('if queue operation is update', () async {
    //   print(todo_.lastModifiedAt);
    //   when(() => queue.operationType)
    //       .thenReturn(QueueOperationType.update.name);
    //   when(() => remoteQueueApi.getQueues()).thenAnswer((_) async => [queue]);
    //   when(() => localQueueApi.getQueues()).thenAnswer((_) async => []);
    //   when(() => remoteTodoApi.getTodo(any())).thenAnswer((_) async => todo_);
    //   when(() => localTodoApi.getTodo(any())).thenAnswer((_) async => todo_);
    //   when(() => localTodoApi.updateTodo(any())).thenAnswer((_) async => todo_);
    //   when(() => localQueueApi.createQueue(any()))
    //       .thenAnswer((_) async => queue);
    //
    //   await sut.needToPull();
    //
    //   verify(() => remoteQueueApi.getQueues()).called(1);
    //   verify(() => localQueueApi.getQueues()).called(1);
    //   verify(() => remoteTodoApi.getTodo(any())).called(1);
    //   verify(() => localTodoApi.getTodo(any())).called(1);
    //   verify(() => localTodoApi.updateTodo(any())).called(1);
    //   verify(() => localQueueApi.createQueue(any())).called(1);
    // });

    test('if queue operation is delete', () async {
      when(() => queue.operationType)
          .thenReturn(QueueOperationType.delete.name);
      when(() => remoteQueueApi.getQueues()).thenAnswer((_) async => [queue]);
      when(() => localQueueApi.getQueues()).thenAnswer((_) async => []);
      when(() => localTodoApi.deleteTodo(any())).thenAnswer((_) async => todo);
      when(() => localQueueApi.createQueue(any()))
          .thenAnswer((_) async => queue);

      await sut.needToPull();

      verify(() => remoteQueueApi.getQueues()).called(1);
      verify(() => localQueueApi.getQueues()).called(1);
      verify(() => localTodoApi.deleteTodo(any())).called(1);
      verify(() => localQueueApi.createQueue(any())).called(1);
    });
  });

  // group('when checkIfNeedToPushSync is called', () {
  //   setUp(() {
  //     when(() => queue.id)
  //         .thenReturn(ObjectId.fromHexString('64d0f9f22912c96e042d4fb7'));
  //     when(() => queue.todoId).thenReturn('64d0f9f22912c96e042d4fb6');
  //     when(() => queue.createdAt).thenReturn('');
  //   });
  //
  //   test('if there are unsynced queues return true', () async {
  //     when(() => localQueueApi.fetchUnSyncedQueues()).thenReturn([queue]);
  //     final value = await sut.pushSyncIfNeeded();
  //     expect(value, true);
  //   });
  //
  //   test('if there are no unsynced queues return false', () async {
  //     when(() => localQueueApi.fetchUnSyncedQueues()).thenReturn([]);
  //     final value = await sut.pushSyncIfNeeded();
  //     expect(value, false);
  //   });
  // });
}
