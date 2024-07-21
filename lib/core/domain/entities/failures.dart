import 'package:equatable/equatable.dart';
import 'package:graphql_task/core/domain/utils/network/constants.dart';

abstract class Failure {}

class ServerFailure extends Equatable implements Failure {
  final String message;
  final ServerErrorCode errorCode;

  const ServerFailure({this.message = '', required this.errorCode});

  @override
  List<Object?> get props => [message,errorCode];
}

class CachFailure implements Failure {}

class LogicFailure implements Failure {
  String message;

  LogicFailure(this.message);
}

class AppAccessDeniedFailure implements Failure {}
