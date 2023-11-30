class UserCheckerModel {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  UserCheckerModel({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory UserCheckerModel.fromJson(Map<String, dynamic> json) {
    return UserCheckerModel(
      result: Result.fromJson(json['result']),
      targetUrl: json['targetUrl'],
      success: json['success'],
      error: json['error'],
      unAuthorizedRequest: json['unAuthorizedRequest'],
      abp: json['__abp'],
    );
  }
}

class Result {
  User? user;
  Tenant? tenant;
  Application application;

  Result({
    required this.user,
    required this.tenant,
    required this.application,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      tenant: json['tenant'] != null ? Tenant.fromJson(json['tenant']) : null,
      application: Application.fromJson(json['application']),
    );
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
  String version;
  String releaseDate;
  String currency;
  String currencySign;
  bool userDelegationIsEnabled;
  Map<String, dynamic> features;
  String compatibleMobileClientVersion;
  String compatibleWebClientVersion;

  Application({
    required this.version,
    required this.releaseDate,
    required this.currency,
    required this.currencySign,
    required this.userDelegationIsEnabled,
    required this.features,
    required this.compatibleMobileClientVersion,
    required this.compatibleWebClientVersion,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      version: json['version'],
      releaseDate: json['releaseDate'],
      currency: json['currency'],
      currencySign: json['currencySign'],
      userDelegationIsEnabled: json['userDelegationIsEnabled'],
      features: json['features'],
      compatibleMobileClientVersion: json['compatibleMobileClientVersion'],
      compatibleWebClientVersion: json['compatibleWebClientVersion'],
    );
  }
}