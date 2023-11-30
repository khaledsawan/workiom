import 'package:clean_architecture_flutter/features/auth/signup/data/model/request/password/password_request.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../constant/url/app_api_url.dart';
import '../../../../../../core/base/base_repo.dart';
import '../../../domain/repository/password_validation_repository.dart';
import '../../model/response/password/password_response_model.dart';

class PasswordRepositoryImp extends MainRepository
    implements PasswordValidationsRepository {
  PasswordRepositoryImp({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });

  @override
  Future<Either<dynamic, PasswordResponseModel>> passwordChecker(
      PasswordRequest passwordRequest) async {
    final result = await data(
      getData: () => remoteData.get(
        path: AppApiUrl.GET_PASSWORD_COMPLEXITY_SETTING_URL,
        headers: headerNoToken(),
        model: PasswordResponseModel(),
      ),
      needCash: false,
    );
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (authResponse) => Right(authResponse),
    );
  }
}
