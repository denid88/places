import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  final int statusCode;

  ServerFailure(this.statusCode) : super('Server error : $statusCode');

  @override
  List<Object> get props => [statusCode, message];
}

class UnknownFailure extends Failure {
  UnknownFailure() : super('Something went wrong');
}