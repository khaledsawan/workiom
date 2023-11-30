
import 'package:dio/dio.dart';

import '../../../../../../../core/base/base_model.dart';

class TenantRequest extends BaseModel<TenantRequest> {
  final String? tenancyName;


  TenantRequest({this.tenancyName});

  factory TenantRequest.fromJson(Map<String, dynamic> json) => TenantRequest(
        tenancyName: json["tenancyName"],
      );

  @override
  TenantRequest fromJson(Map<String, dynamic> json) =>
      TenantRequest.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tenancyName'] = tenancyName;
    return data;
  }

  Future<FormData> formData() async {
    return FormData.fromMap({
      'tenancyName': tenancyName,
    });
  }

  @override
  List<Object?> get props => [tenancyName];
}
