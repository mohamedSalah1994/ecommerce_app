import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata( String email , String password ,  String passwordconfirmation) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password" : password,
      "password_confirmation" : passwordconfirmation,
    });
    return response.fold((l) => l, (r) => r);
  }
}