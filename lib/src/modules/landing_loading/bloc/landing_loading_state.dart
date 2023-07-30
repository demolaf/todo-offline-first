part of 'landing_loading_bloc.dart';

@freezed
class LandingLoadingState with _$LandingLoadingState {
  const factory LandingLoadingState.initial() = _Initial;

  const factory LandingLoadingState.loading() = _Loading;

  const factory LandingLoadingState.navigateToSignIn() = NavigateToSignIn;

  const factory LandingLoadingState.navigateToHome() = NavigateToHome;
}
