import 'package:shopnow/constants/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'welcome_viewmodel.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () {
        return WelcomeViewModel();
      },
      builder:
          (BuildContext context, WelcomeViewModel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: const Color(0xFF317773),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 200,
              ),
              Center(
                  child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 180,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              )),
              // const SizedBox(
              //   height: 200,
              // ),
              Hero(
                tag: 'container',
                child: Container(
                  height: 309,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: Offset(1, -4))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Hello!',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side:
                                BorderSide(color: Color(0xFF317773), width: 1),
                            minimumSize: const Size(250, 48),
                            backgroundColor: Color(0xFF1C3C3A),
                          ),
                          onPressed: () {
                            viewModel.goto();
                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side:
                                BorderSide(color: Color(0xFF1C3C3A), width: 1),
                            minimumSize: const Size(250, 48),
                          ),
                          onPressed: () {
                            viewModel.gotosignup();
                          },
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF1C3C3A),
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
