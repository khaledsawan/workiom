import 'dart:io';
import 'package:formz/formz.dart';
import 'package:mime/mime.dart';

enum PasswordValidationError {
  empty,
  invalid,
  short,
  noUpperCase,
  noLowerCase,
  noDigit,
}

enum NameValidationError { empty }

enum EmailValidationError { empty, invalid, noDomain }

enum FileValidationError { empty, invalid, tooLarge }

enum TenantNameValidationError { empty, invalid }

class Password extends FormzInput<String, List<ValidationError>> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);
  List<ValidationError> _validator(String value) {
    int requiredLength = 7;

    return [
      ValidationError('Password must have at least 7 characters.',
          value.length < requiredLength),
      ValidationError(
          'Password must have at least one uppercase (\'A\'-\'Z\').',
          !value.contains(RegExp(r'[A-Z]'))),
      ValidationError(
          'Password must have at least one lowercase (\'A\'-\'Z\').',
          !value.contains(RegExp(r'[a-z]'))),
      ValidationError('Password must have at least one digit.',
          !value.contains(RegExp(r'[0-9]'))),
      ValidationError('Password must have at least one special character.',
          !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))),
    ];
  }

  @override
  List<ValidationError> validator(String value) {
    return _validator(value);
  }
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    if (value.contains('@example.com')) return EmailValidationError.noDomain;
    if (!_emailRegex.hasMatch(value)) return EmailValidationError.invalid;
    return null;
  }
}

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    return null;
  }
}

class FileChecker extends FormzInput<File?, FileValidationError> {
  const FileChecker.pure() : super.pure(null);
  const FileChecker.dirty([File? value]) : super.dirty(value);

  @override
  FileValidationError? validator(File? value) {
    if (value == null) return FileValidationError.empty;
    final mimeType = lookupMimeType(value.path);
    if (mimeType != null) return null;
    return FileValidationError.invalid;
  }
}

class TenantName extends FormzInput<String, TenantNameValidationError> {
  const TenantName.pure() : super.pure('');
  const TenantName.dirty([String value = '']) : super.dirty(value);

  static final _emailRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9-]*$');

  @override
  TenantNameValidationError? validator(String value) {
    if (value.isEmpty) return TenantNameValidationError.empty;
    if (!_emailRegex.hasMatch(value)) return TenantNameValidationError.invalid;
    return null;
  }
}

class ValidationError {
  final String? error;
  final bool? value;

  ValidationError(
    this.error,
    this.value,
  );
}
