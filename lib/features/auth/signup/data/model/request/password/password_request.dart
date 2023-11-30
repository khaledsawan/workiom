
import 'package:dio/dio.dart';

import '../../../../../../../core/base/base_model.dart';

class PasswordRequest extends BaseModel<PasswordRequest> {
  final String? password;


  PasswordRequest({this.password});

  factory PasswordRequest.fromJson(Map<String, dynamic> json) => PasswordRequest(
        password: json["password"],
      );

  @override
  PasswordRequest fromJson(Map<String, dynamic> json) =>
      PasswordRequest.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    return data;
  }

  Future<FormData> formData() async {
    return FormData.fromMap({
      'password': password,
    });
  }

  @override
  List<Object?> get props => [password];
}
