import 'package:clean_architecture_flutter/features/auth/signup/data/model/request/tenant/tenant_request.dart';
import 'package:clean_architecture_flutter/features/auth/signup/data/model/response/tenant/tenant_response_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../constant/url/app_api_url.dart';
import '../../../../../../core/base/base_repo.dart';
import '../../../domain/repository/isTenant__available_repository.dart';

class TenantRepositoryImp extends MainRepository
    implements IsTenantValidationsRepository {
  TenantRepositoryImp({
    required super.remoteData,
    required super.localData,
    required super.networkInfo,
  });

  @override
  Future<Either<dynamic, TenantResponseModel>> TenantAvailable(
      TenantRequest tenantRequest) async {
    final result = await data(
      getData: () => remoteData.post
      (
        path: AppApiUrl.GET_PASSWORD_COMPLEXITY_SETTING_URL,
        headers: headerNoToken(),
        model: TenantResponseModel(),
        body:tenantRequest 
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
