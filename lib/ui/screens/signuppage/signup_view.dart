import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'signup_viewmodel.dart';


class SignupView extends StatelessWidget {
  const SignupView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () => SignupViewModel(),
      builder: (BuildContext context, SignupViewModel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: const Color(0xFF317773),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 50),
                //Logo----------------------------------------------------------
                Center(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/images/logo3.png',
                      scale: 2.4,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //Main Container------------------------------------------------
                Hero(
                  tag: 'container',
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: Offset(1, -4)
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    //Main Column-------------------------------------------------
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          //Welcome Text--------------------------------------------
                          const Text(
                            'WELCOME',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 25),
                          //Form Fields---------------------------------------------
                          Form(
                            key: viewModel.signupKey, // Add form key
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    controller: viewModel.namecontroller,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.person),
                                      labelText: 'Full Name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    controller: viewModel.emailcontroller,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.email),
                                      labelText: 'Email Id',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      } else if (value.length < 6) {
                                        return 'Please enter a valid email';
                                      } //Regular Expression
                                      else if (!viewModel.emailValid.hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    controller: viewModel.passwordcontroller,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.key),
                                      labelText: 'Create Password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    controller: viewModel.cpasswordcontroller,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.key),
                                      labelText: 'Confirm Password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF317773)),
                                      ),
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a password';
                                      } else if (viewModel.passwordcontroller.text !=
                                          viewModel.cpasswordcontroller.text) {
                                        return 'passwords do not match';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          //Login button--------------------------------------------
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(250, 48),
                              backgroundColor: const Color(0xFF1C3C3A),
                            ),
                            onPressed: () {
                              if (viewModel.signupKey.currentState!.validate()) {
                                viewModel.gotohome();
                              }else {
                                return null;
                              }
                            },
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          //facebook and google icons-------------------------------
                          const Text('or'),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: IconButton(
                                  icon: Image.asset('assets/images/facebook.png'),
                                  iconSize: 60,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: IconButton(
                                  icon: Image.asset('assets/images/google.png'),
                                  iconSize: 60,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          //Login button------------------------------------------
                          TextButton(
                            onPressed: () {
                              viewModel.goto();
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: "Already have an account? ",
                                children: [
                                  TextSpan(
                                    text: 'Log In',
                                    style: TextStyle(
                                      color: Color(0xFF317773),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20), // Added extra space at the bottom
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
