class PenduConstants {
  static final baseUrl = "https://www.pendu.increments.info";

  static final loginUrl = "/api/v1/auth/login";
  static final registerUrl = "/api/v1/auth/register";
  static final userProfileUrl = "/api/v1/auth/profile";
  static final verifyPhoneUrl = "/api/v1/auth/verify-phone";
  static final sendMailUrl = "/api/v1/auth/password/email";
  static final verifyMailOtpUrl = "/api/v1/auth/password/confirm";
  static final changePasswordUrl = "/api/v1/auth/password/reset";

  static final contentType = 'Content-Type';
  static final contentTypeValue = 'application/json';
  static final acceptType = 'Accept';
  static final acceptTypeValue = 'application/json';
  static final accessToken = 'access_token';

  static final sessionKey = 'x-api-key';

  //sharedPrefs
  static final spUser = 'current_user';
  static final spToken = 'user_token';
}
