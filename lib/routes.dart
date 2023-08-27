import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/views/screen/auth/forgetPassword/forget_password_screen.dart';
import 'package:ecommerce_app/views/screen/auth/forgetPassword/reset_password_screen.dart';
import 'package:ecommerce_app/views/screen/auth/forgetPassword/success_reset_password.dart';
import 'package:ecommerce_app/views/screen/auth/forgetPassword/verify_code_screen.dart';
import 'package:ecommerce_app/views/screen/auth/login_screen.dart';
import 'package:ecommerce_app/views/screen/auth/signup_screen.dart';
import 'package:ecommerce_app/views/screen/auth/success_sign_up.dart';
import 'package:ecommerce_app/views/screen/auth/verifycode_signup_screen.dart';
import 'package:ecommerce_app/views/screen/cart_screen.dart';
import 'package:ecommerce_app/views/screen/favorites_screen.dart';
import 'package:ecommerce_app/views/screen/home_screen_main.dart';
import 'package:ecommerce_app/views/screen/items_details_screen.dart';
import 'package:ecommerce_app/views/screen/items_screen.dart';
import 'package:ecommerce_app/views/screen/onboarding_screen.dart';
import 'package:ecommerce_app/views/screen/server_exception_screen.dart';



import 'package:get/get.dart';

import 'core/middleware/my_middleware.dart';
import 'views/screen/language/language_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page:() => const LanguageScreen() , middlewares: [
    MyMiddleware()
  ]),
    //  GetPage(name: "/", page:() => const CartScreen() ),
  
  GetPage(name: AppRoutes.login, page:() => const LoginScreen() ),
  GetPage(name: AppRoutes.signup, page:() =>  const SignUpScreen()),
  GetPage(name: AppRoutes.forgetPassword, page:() =>  const ForgetPasswordScreen()),
  GetPage(name: AppRoutes.verifyCode, page:() =>  const VerifyCodeScreen()),
  GetPage(name: AppRoutes.verifyCodeSignUp, page:() =>  const VerifyCodeSignUpScreen()),
  GetPage(name: AppRoutes.resetPassword, page:() =>  const ResetPasswordScreen()),
  GetPage(name: AppRoutes.successResetPassword, page:() =>  const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page:() =>  const SuccessSignUp()),
  GetPage(name: AppRoutes.onboarding, page:() =>  const OnBoardingScreen()),
  GetPage(name: AppRoutes.home, page: () => const HomeScreenMain()),
  GetPage(name: AppRoutes.items, page: () => const ItemsScreen()),
   GetPage(name: AppRoutes.cart, page: () => const CartScreen()),
   GetPage(name: AppRoutes.itemsDetails, page: () => const ItemsDetailsScreen()),
   GetPage(name: AppRoutes.favorites, page: () => const FavoritesScreen()),
  GetPage(name: AppRoutes.serverException, page: () => const ServerExceptionScreen()),
];



