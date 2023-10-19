part of 'connection_checker_bloc.dart';

abstract class ConnectionCheckerEvent extends Equatable {
  const ConnectionCheckerEvent();

  @override
  List<Object> get props => [];
}

class ConnectionCheckerInitializationRequested extends ConnectionCheckerEvent {
  const ConnectionCheckerInitializationRequested();

  @override
  List<Object> get props => [];
}
