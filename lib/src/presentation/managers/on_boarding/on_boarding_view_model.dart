import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:oxy_boots/core/app_const/app_const_keys.dart';
import 'package:oxy_boots/core/helpers/shared_pref_helpers.dart';
import 'package:oxy_boots/src/presentation/managers/on_boarding/on_boarding_actions.dart';
import 'package:oxy_boots/src/presentation/managers/on_boarding/on_boarding_states.dart';

@injectable
class OnBoardingViewModel extends Cubit<OnBoardingStates>{
  OnBoardingViewModel():super(InitialState());
  PageController onBoardingController = PageController();

  _isLastPage(int index) {
    if (index == 2) {
      emit(LastPageState());
      return;
    }
    emit(NotLastPageState());
  }

  _navigateToLogin() async{
     await SharedPrefHelper.setDate(AppConstKeys.onBoardingKey, true);
     emit(NavigateToLoginState());
  }

  void doAction(OnBoardingActions action){
    switch (action) {
      case NavigateToLoginAction():
        _navigateToLogin();
        break;
      case LastPageAction():
        _isLastPage(action.index!);
        break;
    }
  }
}