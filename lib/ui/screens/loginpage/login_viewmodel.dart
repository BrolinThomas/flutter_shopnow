import 'package:shopnow/app/app.router.dart';
import 'package:shopnow/app/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  bool _rememberMe = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final RegExp emailValid = RegExp(
      r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$');

  bool get rememberMe => _rememberMe;

  void toggleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners(); // Notify listeners to update the UI
  }
  RouteTransitionsBuilder noAnimationTransition = (_, __, ___, child) => child;

  void init() {
    print("init");
  }

  gotohome() {
    navigationService.replaceWith(Routes.homeView,transition: noAnimationTransition);

  }

  gotosignup() {
    navigationService.replaceWith(Routes.signupView,transition: noAnimationTransition);
  }
}
