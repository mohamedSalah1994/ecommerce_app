import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.getData(AppLink.homePage);
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {
      "query": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
