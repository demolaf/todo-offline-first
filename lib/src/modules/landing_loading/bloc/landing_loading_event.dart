part of 'landing_loading_bloc.dart';

abstract class LandingLoadingEvent extends Equatable {
  const LandingLoadingEvent();

  @override
  List<Object> get props => [];
}

class InitializationRequested extends LandingLoadingEvent {
  const InitializationRequested();

  @override
  List<Object> get props => [];
}
