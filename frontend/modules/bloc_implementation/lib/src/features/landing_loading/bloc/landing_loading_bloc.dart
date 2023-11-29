import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/repositories.dart';

part 'landing_loading_bloc.freezed.dart';

part 'landing_loading_event.dart';

part 'landing_loading_state.dart';

class LandingLoadingBloc
    extends Bloc<LandingLoadingEvent, LandingLoadingState> {
  LandingLoadingBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LandingLoadingState.initial()) {
    on<InitializationRequested>(_onInitializationRequested);
  }

  final AuthRepository _authRepository;

  Future<void> _onInitializationRequested(
    InitializationRequested event,
    Emitter<LandingLoadingState> emit,
  ) async {
    emit(const LandingLoadingState.loading());

    final loggedIn = await _authRepository.checkIfUserAuthenticated();
    if (loggedIn) {
      emit(const LandingLoadingState.navigateToHome());
      return;
    }

    emit(const LandingLoadingState.navigateToSignIn());
  }
}
