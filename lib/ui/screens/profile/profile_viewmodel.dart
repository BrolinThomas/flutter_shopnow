import 'package:shopnow/app/app.router.dart';
import 'package:shopnow/app/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileViewmodel extends BaseViewModel {
  void init() {
    print("init");
  }

  void logout() {
    navigationService.pushNamedAndRemoveUntil(Routes.welcomeView);
  }

  void gonotif() {
    navigationService.navigateTo(Routes.notificationsView);
  }

  void gotoorderhistory() {
    navigationService.navigateTo(Routes.orderhistoryView);
  }

  void gotoaddresspage() {
    navigationService.navigateTo(Routes.addressView);
  }

  void gotopayment() {
    navigationService.navigateTo(Routes.paymentView);
  }

  void gototrackorder() {
    navigationService.navigateTo(Routes.trackView);
  }

  void gotosuccesstemp() {
    navigationService.navigateTo(Routes.successView);
  }
}
