import 'package:shopnow/constants/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'welcome_viewmodel.dart';
import 'package:lottie/lottie.dart';

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
                height: 150,
              ),
              Center(
                  child: Hero(
                tag: 'logo',
                child: Column(
                  children: [
                    Lottie.asset('assets/images/logo.json',repeat: false,width: 250,fit: BoxFit.fill),
                    const SizedBox(height: 20,),
                    Image.asset(
                      'assets/images/logo3.png',
                      scale: 2,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              )),
              // const SizedBox(
              //   height: 200,
              // ),
              Hero(
                tag: 'container',
                child: Container(
                  height: MediaQuery.sizeOf(context).height/2.7,
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
                        'Welcome',
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
                                const BorderSide(color: Color(0xFF317773), width: 1),
                            minimumSize: const Size(250, 48),
                            backgroundColor: const Color(0xFF1C3C3A),
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
                                const BorderSide(color: Color(0xFF1C3C3A), width: 1),
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
