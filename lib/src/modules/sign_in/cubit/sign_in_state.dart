part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;

  const factory SignInState.authenticating({
    required ProcessingState processingState,
    required String message,
  }) = SignInStateAuthenticating;

  const factory SignInState.authenticated() = SignInStateAuthenticated;
}
