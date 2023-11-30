import 'package:dartz/dartz.dart';

import '../../data/model/request/password/password_request.dart';
import '../../data/model/response/password/password_response_model.dart';

abstract class PasswordValidationsRepository {
  Future<Either<dynamic, PasswordResponseModel>> passwordChecker(
      PasswordRequest passwordRequest);
}
