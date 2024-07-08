import 'package:shopnow/app/app.router.dart';
import 'package:shopnow/app/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WelcomeViewModel extends BaseViewModel {
  void init() {
    print("init");
  }

  RouteTransitionsBuilder noAnimationTransition = (_, __, ___, child) => child;

  goto() {
    navigationService.replaceWith(
      Routes.loginView,
      transition: noAnimationTransition,
    );
  }

  gotosignup() {
    navigationService.replaceWith(
      Routes.signupView,
      transition: noAnimationTransition,
    );
  }
}