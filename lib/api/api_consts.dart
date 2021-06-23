class PenduConstants {
  static final baseUrl = "https://www.pendu.increments.info";

  static final loginUrl = "/api/v1/auth/login";
  static final registerUrl = "/api/v1/auth/register";
  static final userProfileUrl = "/api/v1/auth/profile";
  static final verifyPhoneUrl = "/api/v1/auth/verify-phone";
  static final sendMailUrl = "/api/v1/auth/password/email";
  static final verifyMailOtpUrl = "/api/v1/auth/password/confirm";
  static final changePasswordUrl = "/api/v1/auth/password/reset";
  static final allBlogPostUrl = "/api/v1/posts/";

  static final productCategoryUrl = "/api/v1/product-categories";
  static final vehicalDataUrl = "/api/v1/vehicles";
  static final couponDataUrl = "/api/v1/coupons";
  static final serviceCategoryUrl = "/api/v1/service-categories";

  static final taskShopDropUrl = "/api/v1/tasks";
  static final taskCollectDropUrl = "/api/v1/tasks";
  static final taskMoversUrl = "/api/v1/tasks";

  static final taskCheckoutUrl = "/api/v1/tasks/1/offers/2/checkout";

  static final taskOffersList = "/api/v1/tasks/1/offers";
  static final acceptOfferGetDetails = "/api/v1/tasks/1/offers/1";

  static final orderReviewByUser = "/api/v1/task-order/1/review";
  static final giveTipToDropper = "api/v1/task-order/1/tips";

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
