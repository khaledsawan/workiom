import '../../../../../core/base/base_model.dart';

class UserChecker extends BaseModel{
  Result? result;
  Null? targetUrl;
  bool? success;
  Null? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  UserChecker({this.result, this.targetUrl, this.success, this.error, this.unAuthorizedRequest, this.bAbp});

  UserChecker.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
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
  fromJson(Map<String, dynamic> json) {
   return UserChecker.fromJson(json);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Result {
  User? user;
  Tenant? tenant;
  Application? application;

  Result({this.user, this.tenant, this.application});

  Result.fromJson(Map<String, dynamic> json) {
    user: json['user'] != null ? User.fromJson(json['user']!) : null;
    tenant: json['tenant'] != null ? Tenant.fromJson(json['tenant']!) : null;
    application = json['application'] != null ? new Application.fromJson(json['application']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['tenant'] = this.tenant;
    if (this.application != null) {
      data['application'] = this.application!.toJson();
    }
    return data;
  }
}
class User {
  // Add properties if user details are provided
  User(); // Add a constructor if needed

  factory User.fromJson(Map<String, dynamic> json) {
    return User();
  }
}

class Tenant {
  // Add properties if tenant details are provided
  Tenant(); // Add a constructor if needed

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant();
  }
}
class Application {
  String? version;
  String? releaseDate;
  String? currency;
  String? currencySign;
  bool? userDelegationIsEnabled;
  Features? features;
  String? compatibleMobileClientVersion;
  String? compatibleWebClientVersion;

  Application({this.version, this.releaseDate, this.currency, this.currencySign, this.userDelegationIsEnabled, this.features, this.compatibleMobileClientVersion, this.compatibleWebClientVersion});

  Application.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    releaseDate = json['releaseDate'];
    currency = json['currency'];
    currencySign = json['currencySign'];
    userDelegationIsEnabled = json['userDelegationIsEnabled'];
    features = json['features'] != null ? new Features.fromJson(json['features']) : null;
    compatibleMobileClientVersion = json['compatibleMobileClientVersion'];
    compatibleWebClientVersion = json['compatibleWebClientVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['releaseDate'] = this.releaseDate;
    data['currency'] = this.currency;
    data['currencySign'] = this.currencySign;
    data['userDelegationIsEnabled'] = this.userDelegationIsEnabled;
    if (this.features != null) {
      data['features'] = this.features!.toJson();
    }
    data['compatibleMobileClientVersion'] = this.compatibleMobileClientVersion;
    data['compatibleWebClientVersion'] = this.compatibleWebClientVersion;
    return data;
  }
}

class Features {


  Features();

Features.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
return data;
}
}