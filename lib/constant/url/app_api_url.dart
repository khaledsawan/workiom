// ignore_for_file: constant_identifier_names

class AppApiUrl {
  /*  for app   */
  static const String APP_NAME = "workiom";
  static const int APP_VERSION = 1;

  /*  for api   */

  //for base Uri
  static const String BASE_URL ="http://api.workiom.site";

  //for GetCurrentLoginInformation
  static const String GET_CURRENT_LOGIN_INFORMATION_URL = "/api/services/app/Session/GetCurrentLoginInformations";

  //GetEditionsForSelect
  static const String GET_EDITIONS_FOR_SELECT_URL = "/api/services/app/TenantRegistration/GetEditionsForSelect";

  //GetPasswordComplexitySetting
  static const String GET_PASSWORD_COMPLEXITY_SETTING_URL = "/api/services/app/Profile/GetPasswordComplexitySetting";

  //IsTenantAvailable
  static const String POST_IS_TENANT_AVAILABLE_URL = "/api/services/app/Account/IsTenantAvailable";

  //RegisterTenant
  static const String POST_REGISTER_TENANT_URL = "/api/services/app/TenantRegistration/RegisterTenant";

  //Authenticate
  static const String POST_AUTHENTICATE_URL = "/api/TokenAuth/Authenticate";

  //for student course
  static const String STUDENT_COURSES_URL = "/api/indexCoursesStudent";

  //for Auth
  static const String LOGIN_URL = "/api/login";
  static const String SIGNUP_URL = "/api/signup";

  /*  for local storage   */

  //for Auth
  static const String TOKEN = "token";
  static const String ROLE = "role";
  static const String PHONE = "phone";
  static const String PASSWORD = "password";
  static const String EMAIL = "email";
  static const String VERIFY = "verify";
  static const String VERIFYTOKEN = "verifyToken";
  static const String USERID = "USERID";

  //for config
  static const String INTRO = "intro";
  static const String DARK_MODE = "darkmode";
}
class AppWebUrl{
  static const String WEB_URL ="https://workiom.com";
  static const String WEB_CONDITIONS_URL ="https://workiom.com/terms-conditions";
  static const String WEB_POLICY_URL ="https://workiom.com/privacy-policy";
}