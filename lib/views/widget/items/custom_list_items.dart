

import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/items_model.dart';

class CustomListItems extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
            'assets/images/laptop.png',
            height: 95,
            fit: BoxFit.fill,
          ),
              const SizedBox(height: 10) , 
              Text(translateDatabase(itemsModel.nameAr, itemsModel.name),
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Rating 3.5 ", textAlign: TextAlign.center),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${itemsModel.price} \$",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans")),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: AppColors.primaryColor,
                      ))
                ],
              )
            ]),
      ),
    ));
  }
}