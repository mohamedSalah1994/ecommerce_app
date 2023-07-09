import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);
  postdata( String email , String verifycode ) async {
    var response = await crud.postData(AppLink.verifyCodeForgetPassword, {
      "email": email,
      "verify_code" : verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}