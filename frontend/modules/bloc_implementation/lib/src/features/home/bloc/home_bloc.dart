import 'package:apis/apis.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/repositories.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required TodoRepository todoRepository,
    required TodoSyncRepository todoSyncRepository,
  })  : _todoRepository = todoRepository,
        _todoSyncRepository = todoSyncRepository,
        super(const HomeState.initial()) {
    on<HomeInitializationRequested>((event, emit) async {
      await emit.onEach(
        _todoRepository.getAllTodos(),
        onData: (todos) async {
          emit(
            HomeState.ready(
              today: todos
                  .where(
                    (element) =>
                        DateTime.tryParse(element.time ?? '')?.isToday() ??
                        false,
                  )
                  .toList()
                ..sort((a, b) => (b.time ?? '').compareTo(a.time ?? '')),
              upcoming: todos
                  .where(
                    (element) =>
                        DateTime.tryParse(element.time ?? '')
                            ?.isAheadOfToday() ??
                        false,
                  )
                  .toList()
                ..sort((a, b) => (a.time ?? '').compareTo(b.time ?? '')),
              completed: todos
                  .where(
                    (element) => element.completed ?? false,
                  )
                  .toList(),
            ),
          );
        },
      );
    });

    on<QueuesDataRequested>((event, emit) async {
      await emit.onEach(
        _todoSyncRepository.getAllQueues(),
        onData: (queues) async {
          emit(HomeState.viewingQueues(queues: queues));
        },
      );
    });
  }

  final TodoRepository _todoRepository;
  final TodoSyncRepository _todoSyncRepository;
}
