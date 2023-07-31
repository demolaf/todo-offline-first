part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = HomeStateLoading;

  const factory HomeState.ready({required List<TodoDTO> todos}) =
      HomeStateReady;
}
