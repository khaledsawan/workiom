import 'package:dartz/dartz.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../data/model/request/password/password_request.dart';
import '../../data/model/response/password/password_response_model.dart';
import '../repository/password_validation_repository.dart';

class PasswordValidationUseCase extends UseCase<PasswordResponseModel,PasswordRequest> {
  final PasswordValidationsRepository passwordValidationsRepository;

  PasswordValidationUseCase(this.passwordValidationsRepository);

  @override
  Future<Either<dynamic,PasswordResponseModel>> call(params) {
    return passwordValidationsRepository.passwordChecker(params) ;
  }
}

