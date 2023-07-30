import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_loading_bloc.freezed.dart';

part 'landing_loading_event.dart';

part 'landing_loading_state.dart';

class LandingLoadingBloc
    extends Bloc<LandingLoadingEvent, LandingLoadingState> {
  LandingLoadingBloc() : super(const LandingLoadingState.initial()) {
    on<InitializationRequested>(_onInitializationRequested);
  }

  Future<void> _onInitializationRequested(
    InitializationRequested event,
    Emitter<LandingLoadingState> emit,
  ) async {
    emit(const LandingLoadingState.loading());

    emit(const LandingLoadingState.navigateToHome());
  }
}
