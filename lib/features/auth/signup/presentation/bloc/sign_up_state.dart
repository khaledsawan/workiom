part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState(
      {this.isValid = false,
      this.email = const Email.pure(),
      this.workSpace = const Name.pure(),
      this.firstName = const Name.pure(),
      this.lastName = const Name.pure(),
      this.password = const Password.pure(),
      this.status = FormzSubmissionStatus.initial});

  final Email email;
  final Name workSpace;
  final Name firstName;
  final Name lastName;
  final Password password;
  final FormzSubmissionStatus status;
  final bool isValid;

  SignUpState copyWith({
    Email? email,
    Name? workSpace,
    Name? firstName,
    Name? lastName,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) {
    return SignUpState(
      email: email ?? this.email,
      workSpace: workSpace ?? this.workSpace,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [email,workSpace,firstName,lastName,password, status, isValid];
}
