import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:todo_bloc/src/data/repositories/connection_checker/connection_checker.dart';

class ConnectionCheckerImpl implements ConnectionChecker {
  ConnectionCheckerImpl({required InternetConnection internetConnection})
      : _internetConnection = internetConnection;

  final InternetConnection _internetConnection;

  @override
  Stream<InternetStatus> getInternetStatus() {
    return _internetConnection.onStatusChange;
  }
}
