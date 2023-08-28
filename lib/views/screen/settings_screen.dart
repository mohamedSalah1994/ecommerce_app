import 'package:ecommerce_app/controllers/settings_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(SettingsController());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: Get.width / 2,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              ),
               Positioned(
                top: Get.width /2.5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration:  BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: const CircleAvatar(
                    
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/person.png'),
                    radius: 40,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
           Card(
            child: Column(
              children: [
                 GetBuilder<SettingsController>(builder: (controller) =>  ListTile(
                    onTap: (){},
                  title: const Text('Disable Notification'),
                  trailing: Switch(value: controller.light,activeColor: AppColors.primaryColor ,onChanged: controller.onChangeLite ,  ),
                ),),
                  ListTile(
                    onTap: (){},
                  title: const Text('Address'),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                  ListTile(
                    onTap: (){},
                  title: const Text('About Us'),
                  trailing: const Icon(Icons.info_outline),
                ),
                                  ListTile(
                    onTap: (){},
                  title: const Text('Contact Us'),
                  trailing: const Icon(Icons.call),
                ),
                  ListTile(
                    onTap: (){},
                  title: const Text('Log out'),
                  trailing: const Icon(Icons.logout_outlined),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
