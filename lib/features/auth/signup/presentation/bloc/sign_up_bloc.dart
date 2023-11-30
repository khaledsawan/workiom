import 'dart:io';
import 'package:clean_architecture_flutter/features/auth/signup/data/model/request/password/password_request.dart';
import 'package:clean_architecture_flutter/features/auth/signup/data/model/request/tenant/tenant_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../di.dart';
import '../../../../common_forms/common_form.dart';
import '../../data/model/request/signup/signup_request.dart';
import '../../domain/use_case/get_edition_use_case.dart';
import '../../domain/use_case/isTenant_available_use_vase.dart';
import '../../domain/use_case/password_validation_use_case.dart';
import '../../domain/use_case/signup_use_case.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final signUpUseCase = SignUpUseCase(getIt());
  final passwordValidation = PasswordValidationUseCase(getIt());
  final isTenantAvailableUseCase = IsTenantAvailableUseCase(getIt());
  final getEditionUseCase = GetEditionUseCase(getIt());
  late int editionId;
  SignUpBloc() : super(const SignUpState()) {
    _getEditions();
    on<SignUpButtonPressed>(_onSubmitted);
    on<EmailChange>(_onEmailChanged);
    on<EmailChangeUnFocus>(_onEmailUnfocused);
    on<WorkSpaceChange>(_onWorkSpaceChanged);
    on<WorkSpaceChangeUnFocus>(_onWorkSpaceUnfocused);
    on<LastNameChange>(_onLastNameChanged);
    on<LastNameChangeUnFocus>(_onLastNameUnfocused);
    on<FirstNameChange>(_onFirstNameChanged);
    on<FirstNameChangeUnFocus>(_onFirstNameUnfocused);
    on<PasswordChange>(_onPasswordChanged);
    on<PasswordChangeUnFocus>(_onPasswordUnfocused);
  }
  Future<void> _getEditions() async {
    final data = await getEditionUseCase.call(NoParams());
    data.fold((l) => _getEditions(), (r) => editionId = r.id!);
  }

  void _onEmailChanged(EmailChange event, Emitter<SignUpState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email.isValid ? email : Email.dirty(event.email),
        isValid: Formz.validate([
          email,
          state.lastName,
          state.firstName,
          state.workSpace,
        ]),
      ),
    );
  }

  void _onEmailUnfocused(EmailChangeUnFocus event, Emitter<SignUpState> emit) {
    final email = Email.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.lastName,
          state.firstName,
          state.workSpace,
        ]),
      ),
    );
  }

  void _onWorkSpaceChanged(WorkSpaceChange event, Emitter<SignUpState> emit) {
    final workSpace = Name.dirty(event.workSpace);
    _onIsTenantAvailable(emit);
    emit(
      state.copyWith(
        workSpace: workSpace.isValid ? workSpace : Name.dirty(event.workSpace),
        isValid: Formz.validate([
          workSpace,
          state.email,
          state.lastName,
          state.firstName,
        ]),
      ),
    );
  }

  void _onWorkSpaceUnfocused(
      WorkSpaceChangeUnFocus event, Emitter<SignUpState> emit) {
    final workSpace = Name.dirty(state.workSpace.value);
    emit(
      state.copyWith(
        workSpace: workSpace,
        isValid: Formz.validate([
          workSpace,
          state.lastName,
          state.firstName,
          state.email,
        ]),
      ),
    );
  }

  void _onFirstNameChanged(FirstNameChange event, Emitter<SignUpState> emit) {
    final firstName = Name.dirty(event.firstName);
    emit(
      state.copyWith(
        firstName: firstName.isValid ? firstName : Name.dirty(event.firstName),
        isValid: Formz.validate([
          firstName,
          state.lastName,
          state.workSpace,
          state.email,
        ]),
      ),
    );
  }

  void _onFirstNameUnfocused(
      FirstNameChangeUnFocus event, Emitter<SignUpState> emit) {
    final firstName = Name.dirty(state.firstName.value);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([
          firstName,
          state.lastName,
          state.workSpace,
          state.email,
        ]),
      ),
    );
  }

  void _onLastNameChanged(LastNameChange event, Emitter<SignUpState> emit) {
    final lastName = Name.dirty(event.lastName);
    emit(
      state.copyWith(
        lastName: lastName.isValid ? lastName : Name.dirty(event.lastName),
        isValid: Formz.validate([
          lastName,
          state.workSpace,
          state.firstName,
          state.email,
        ]),
      ),
    );
  }

  void _onLastNameUnfocused(
      LastNameChangeUnFocus event, Emitter<SignUpState> emit) {
    final lastName = Name.dirty(state.lastName.value);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate([
          lastName,
          state.workSpace,
          state.firstName,
          state.email,
        ]),
      ),
    );
  }

  void _onPasswordChanged(
    PasswordChange event,
    Emitter<SignUpState> emit,
  ) {
    _onPasswordValidation(emit);
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
            [state.email, state.workSpace, state.firstName, state.lastName]),
      ),
    );
  }

  void _onPasswordUnfocused(
    PasswordChangeUnFocus event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
            [state.email, state.workSpace, state.firstName, state.lastName]),
      ),
    );
  }

  Future<void> _onIsTenantAvailable(
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final response = await isTenantAvailableUseCase.call(TenantRequest(tenancyName: state.workSpace.value));
      response.fold((l) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }, (r) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      });
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> _onPasswordValidation(
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final response = await passwordValidation
          .call(PasswordRequest(password: state.password.value));
      response.fold((l) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }, (r) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        //  r.result.setting.
      });
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> _onSubmitted(
    SignUpButtonPressed event,
    Emitter<SignUpState> emit,
  ) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final workSpace = Name.dirty(state.workSpace.value);
    final firstName = Name.dirty(state.firstName.value);
    final lastName = Name.dirty(state.lastName.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        workSpace: workSpace,
        firstName: firstName,
        lastName: lastName,
        isValid:
            Formz.validate([email, password, workSpace, firstName, lastName]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final response = await signUpUseCase.call(SignUpRequest(
          email: state.email.value,
          password: state.password.value,
        ));
        response.fold((l) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }, (r) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        });
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
