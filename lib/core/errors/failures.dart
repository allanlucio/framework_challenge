import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchFailure extends Failure {}

class PrintFailure extends Failure {}

class AuthFailure extends Failure {}
