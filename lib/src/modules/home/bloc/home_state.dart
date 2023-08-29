part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = HomeStateLoading;

  const factory HomeState.ready({
    required List<Todo> today,
    required List<Todo> upcoming,
    required List<Todo> completed,
  }) = HomeStateReady;

  const factory HomeState.viewingQueues({required List<QueueObject> queues}) =
      ViewingQueues;
}
