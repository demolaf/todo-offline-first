import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:todo_bloc/src/data/repositories/connection_checker/connection_checker.dart';

part 'connection_checker_bloc.freezed.dart';

part 'connection_checker_event.dart';

part 'connection_checker_state.dart';

class ConnectionCheckerBloc
    extends Bloc<ConnectionCheckerEvent, ConnectionCheckerState> {
  ConnectionCheckerBloc({
    required ConnectionChecker connectionChecker,
  })  : _connectionChecker = connectionChecker,
        super(const ConnectionCheckerState.initial()) {
    on<ConnectionCheckerInitializationRequested>(
      _connectionCheckerInitializationRequested,
    );
  }

  final ConnectionChecker _connectionChecker;

  Future<void> _connectionCheckerInitializationRequested(
    ConnectionCheckerInitializationRequested event,
    Emitter<ConnectionCheckerState> emit,
  ) async {
    emit(const ConnectionCheckerState.loading());
    try {
      await emit.forEach(
        _connectionChecker.getInternetStatus(),
        onData: (data) {
          switch (data) {
            case InternetStatus.connected:
              return const ConnectionCheckerState.ready(connected: true);
            case InternetStatus.disconnected:
              return const ConnectionCheckerState.ready(connected: false);
          }
        },
      );
    } catch (e) {
      emit(ConnectionCheckerState.error(message: e.toString()));
    }
  }
}
