part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitializationRequested extends HomeEvent {
  const HomeInitializationRequested();

  @override
  List<Object> get props => [];
}

class QueuesDataRequested extends HomeEvent {
  const QueuesDataRequested();

  @override
  List<Object> get props => [];
}
