import 'package:clean_architecture_flutter/features/auth/signup/data/model/request/tenant/tenant_request.dart';
import 'package:clean_architecture_flutter/features/auth/signup/data/model/response/tenant/tenant_response_model.dart';
import 'package:dartz/dartz.dart';


abstract class IsTenantValidationsRepository {
  Future<Either<dynamic, TenantResponseModel>> TenantAvailable(
      TenantRequest tenantRequest);
}
