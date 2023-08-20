import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class VerifyCodeSignUpData {
  Crud crud;

  
  VerifyCodeSignUpData(this.crud);
  postdata( String email, String verifycode) async {
    var response = await crud.postData(AppLink.check, {
      
      
      "email": email,
      "verify_code": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

    resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
