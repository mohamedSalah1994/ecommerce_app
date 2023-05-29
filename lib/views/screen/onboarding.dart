import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: onBoardingList.length,
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  onBoardingList[index].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 80,),
              Image.asset(onBoardingList[index].image! , width: 200, height: 250, fit: BoxFit.fill,),
               const SizedBox(height: 80,),
              Text(
                onBoardingList[index].body!,
                textAlign: TextAlign.center,
                style:  TextStyle(height: 2, color: AppColor.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
