part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class ImageChange extends SignUpEvent {
  final File image;

  ImageChange({required this.image});
}

class ImageDeleted extends SignUpEvent {}

class EmailChange extends SignUpEvent {
  final String email;

  EmailChange({required this.email});
}

class EmailChangeUnFocus extends SignUpEvent {}

class WorkSpaceChange extends SignUpEvent {
  final String workSpace;

  WorkSpaceChange({required this.workSpace});
}

class WorkSpaceChangeUnFocus extends SignUpEvent {}

class FirstNameChange extends SignUpEvent {
  final String firstName;

  FirstNameChange({required this.firstName});
}

class FirstNameChangeUnFocus extends SignUpEvent {}

class LastNameChange extends SignUpEvent {
  final String lastName;

  LastNameChange({required this.lastName});
}

class LastNameChangeUnFocus extends SignUpEvent {}

class PasswordChange extends SignUpEvent {
  final String password;

  PasswordChange({required this.password});
}

class PasswordChangeUnFocus extends SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {}
