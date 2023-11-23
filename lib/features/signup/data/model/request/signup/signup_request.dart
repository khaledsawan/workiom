import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../../core/base/base_model.dart';

class SignUpRequest extends BaseModel<SignUpRequest> {
  final String? email;
  final String? password;
  final File? metaData;

  SignUpRequest({this.email, this.password, this.metaData});

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        email: json["email"],
        password: json["password"],
        metaData: json["metaData"],
      );

  @override
  SignUpRequest fromJson(Map<String, dynamic> json) =>
      SignUpRequest.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['metaData'] = metaData;
    return data;
  }

  Future<FormData> formData() async {
    return FormData.fromMap({
      'metaData': [
        await MultipartFile.fromFile(metaData!.path, filename: metaData!.path)
      ],
      'password': password,
      'email': email,
    });
  }

  @override
  List<Object?> get props => [email, password, metaData];
}
