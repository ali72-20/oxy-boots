import 'package:flutter/cupertino.dart';

@protected
class ValidatorManagers{
  ValidatorManagers._();
   static  String? validateEmail(String email){
    if(email.isEmpty || email == null || !email.contains('@') || !email.contains('.')){
      return "Not valid email";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty || password == null || password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
}