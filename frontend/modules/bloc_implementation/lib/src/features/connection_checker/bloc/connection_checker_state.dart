part of 'connection_checker_bloc.dart';

@freezed
class ConnectionCheckerState with _$ConnectionCheckerState {
  const factory ConnectionCheckerState.initial() =
      _ConnectionCheckerStateInitial;

  const factory ConnectionCheckerState.loading() =
      ConnectionCheckerStateLoading;

  const factory ConnectionCheckerState.ready({required bool connected}) =
      ConnectionCheckerStateReady;

  const factory ConnectionCheckerState.error({required String message}) =
      ConnectionCheckerStateError;
}
