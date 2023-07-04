import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String name, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "name": name,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
  