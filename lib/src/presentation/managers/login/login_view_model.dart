import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:oxy_boots/src/presentation/managers/core/validator_managers.dart';
import 'package:oxy_boots/src/presentation/managers/login/login_actions.dart';
import 'package:oxy_boots/src/presentation/managers/login/login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates>{
  LoginViewModel(): super(InitialSate());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  String? validateEmail(){
    String email = emailController.text;
    return ValidatorManagers.validateEmail(email);
  }

  String? validatePassword(){
    String password = passwordController.text;
    return ValidatorManagers.validatePassword(password);
  }

  _changePasswordVisibility(){
    isObscure = !isObscure;
    emit(ChangePasswordVisibilityState());
  }
  void doAction(LoginActions action){
    switch (action) {
      case ChangePasswordVisibilityAction():
        _changePasswordVisibility();
        break;
    }
  }
}