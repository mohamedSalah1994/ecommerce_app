import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/views/widget/language/custom_button_lang.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose Language',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20,),
               CustomButtonLang(textButton: 'AR' , onPressed: (){},),
               
               CustomButtonLang(textButton: 'EN' , onPressed: (){},),
            ],
          ),
        ),
      ),
    );
  }
}
