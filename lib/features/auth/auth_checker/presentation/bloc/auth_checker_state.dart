part of 'auth_checker_bloc.dart';

abstract class AuthCheckerState extends Equatable {
  const AuthCheckerState();
  @override
  List<Object> get props => [];
}

class AuthCheckerInitial extends AuthCheckerState {}

class AuthCheckerLoading extends AuthCheckerState {}

class AuthCheckerFail extends AuthCheckerState {}

class AuthCheckerLoaded extends AuthCheckerState {
  final UserChecker user;
  const AuthCheckerLoaded(this.user);
}
