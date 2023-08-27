class AppLink {
  static const String server = 'http://127.0.0.1:8000/api';
  static const String test = '$server/users';

// ================================= Auth ========================== //
  static const String signUp = "$server/store";
  static const String check = "$server/check";
  static const String login = "$server/login";
   static const String resend = "$server/resend-verification-code";

// ================================= ForgetPassword ========================== //
  static const String checkEmail = "$server/check_email";
  static const String verifyCodeForgetPassword =
      "$server/verify_code_forget_password";
  static const String resetPassword = "$server/reset_password";

// ================================= Home ========================== //
  static const String homePage = "$server/home";

// ================================= items ========================== //
  static String items = "$server/items";
  static String addItem = "$server/add_item";
  static String removeItem = "$server/remove_item";
  static String myFavorites = "$server/favorite_items";

  // ================================= items ========================== //
  static String cart = "$server/cart";
  static String addToCart = "$server/cart/add";
  static String removeFromCart = "$server/cart/remove";
  static String countItems = "$server/cart/item-quantity";
}



