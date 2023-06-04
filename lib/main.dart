import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/localization/change_locale.dart';
import 'package:ecommerce_app/core/localization/translation.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/views/screen/auth/login_screen.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
        fontFamily: 'PlayfairDisplay',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: AppColor.black,
          ),
          bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
             height: 1.7,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColor.black,
          ),
          
        ),
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: routes,
    );
  }
}
