import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../data/model/items_model.dart';

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({Key? key, required this.listDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listDataModel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToItemsDetailsScreen(listDataModel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/logoapp.png',
                        height: 100,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listDataModel[index].name),
                          subtitle: Text(listDataModel[index].categoryName),
                          trailing: Text('${listDataModel[index].price} \$'),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}