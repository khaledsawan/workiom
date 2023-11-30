import 'package:clean_architecture_flutter/features/auth/signup/data/model/request/tenant/tenant_request.dart';
import 'package:clean_architecture_flutter/features/auth/signup/data/model/response/tenant/tenant_response_model.dart';
import 'package:clean_architecture_flutter/features/auth/signup/domain/repository/isTenant__available_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/usecases/usecase.dart';

class IsTenantAvailableUseCase extends UseCase<TenantResponseModel,TenantRequest> {
  final IsTenantValidationsRepository isTenantRepo;

  IsTenantAvailableUseCase(this.isTenantRepo);

  @override
  Future<Either<dynamic,TenantResponseModel>> call(params) {
    return isTenantRepo.TenantAvailable(params) ;
  }
}

