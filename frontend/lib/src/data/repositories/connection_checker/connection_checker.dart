// ignore_for_file: one_member_abstracts
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class ConnectionChecker {
  Stream<InternetStatus> getInternetStatus();
}
