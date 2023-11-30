import '../../../../../../../core/base/base_model.dart';

// ignore: must_be_immutable
class PasswordResponseModel extends BaseModel<PasswordResponseModel> {
  Result? result;
  Null? targetUrl;
  bool? success;
  Null? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  PasswordResponseModel(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  PasswordResponseModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['targetUrl'] = this.targetUrl;
    data['success'] = this.success;
    data['error'] = this.error;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }

  @override
  PasswordResponseModel fromJson(Map<String, dynamic> json) {
    return PasswordResponseModel.fromJson(json);
  }

  @override
  List<Object?> get props => [];
}

class Result {
  Setting? setting;

  Result({this.setting});

  Result.fromJson(Map<String, dynamic> json) {
    setting =
        json['setting'] != null ? new Setting.fromJson(json['setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.setting != null) {
      data['setting'] = this.setting!.toJson();
    }
    return data;
  }
}

class Setting {
  bool? requireDigit;
  bool? requireLowercase;
  bool? requireNonAlphanumeric;
  bool? requireUppercase;
  int? requiredLength;

  Setting(
      {this.requireDigit,
      this.requireLowercase,
      this.requireNonAlphanumeric,
      this.requireUppercase,
      this.requiredLength});

  Setting.fromJson(Map<String, dynamic> json) {
    requireDigit = json['requireDigit'];
    requireLowercase = json['requireLowercase'];
    requireNonAlphanumeric = json['requireNonAlphanumeric'];
    requireUppercase = json['requireUppercase'];
    requiredLength = json['requiredLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requireDigit'] = this.requireDigit;
    data['requireLowercase'] = this.requireLowercase;
    data['requireNonAlphanumeric'] = this.requireNonAlphanumeric;
    data['requireUppercase'] = this.requireUppercase;
    data['requiredLength'] = this.requiredLength;
    return data;
  }
}
