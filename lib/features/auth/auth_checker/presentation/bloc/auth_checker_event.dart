part of 'auth_checker_bloc.dart';

abstract class AuthCheckerEvent extends Equatable {
  const AuthCheckerEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthChecker extends AuthCheckerEvent {
  const CheckAuthChecker() : super();
}
