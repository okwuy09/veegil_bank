import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank/authentication/signup.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/style.dart';
import 'package:veegil_bank/service/provider.dart';
import 'package:veegil_bank/widget/bottom_navbar.dart';
import 'package:veegil_bank/widget/button.dart';
import 'package:veegil_bank/widget/navigation_box.dart';
import 'package:veegil_bank/widget/textform.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

TextEditingController _phoneField = TextEditingController();
TextEditingController _passwordField = TextEditingController();

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // used to determined the screen size for responsive design
    var screensize = MediaQuery.of(context).size;
    var provider = Provider.of<Data>(context);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: ListView(
        children: [
          Form(
            key: _globalFormKey,
            child: Column(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //navigation button
                        NavigationBox(
                          color: AppColor.white,
                          onTap: () {},
                        ),

                        SizedBox(height: screensize.height * 0.08),

                        Text(
                          'Hi There! 👋',
                          style: style.copyWith(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                        ),

                        SizedBox(height: screensize.height * 0.01),

                        Text(
                          'Welcome back, Sign in to your account',
                          style: style.copyWith(color: AppColor.lightGrey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screensize.height / 1.82,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: AppColor.white,
                    child: Column(
                      children: [
                        // signin email form
                        SizedBox(height: screensize.height * 0.08),
                        MyTextForm(
                          obscureText: false,
                          hintText: 'Phone',
                          controller: _phoneField,
                          validatior: (input) => (input!.isEmpty)
                              ? "Enter correct phone number"
                              : null,
                        ),

                        SizedBox(height: screensize.height * 0.02),
                        // signin password form
                        MyTextForm(
                          obscureText: _isObscure,
                          controller: _passwordField,
                          hintText: 'Password',
                          validatior: (input) =>
                              (input!.isEmpty) ? "Enter valid password" : null,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColor.darkGrey,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _isObscure = !_isObscure;
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: screensize.height * 0.02),
                        //recover password navigation rout
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: style.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.orange),
                            ),
                          ),
                        ),
                        SizedBox(height: screensize.height * 0.02),

                        MainButton(
                          text: provider.isSignIn
                              ? buttonCircularIndicator
                              : Text(
                                  'Sign In',
                                  style: style.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColor.white,
                                  ),
                                ),
                          backgroundColor: AppColor.primaryColor,
                          onTap: () async {
                            if (_globalFormKey.currentState!.validate()) {
                              var res = await provider.signIn(
                                  _phoneField.text.trim(),
                                  _passwordField.text.trim());
                              if (res.statusCode == 200) {
                                if (!mounted) return;
                                successOperation(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const BottomNavBar()),
                                );
                              } else {
                                if (!mounted) return;
                                failedOperation(context);
                              }
                            }
                          },
                        ),

                        SizedBox(height: screensize.height * 0.04),
                        // nevigate to register page, if you dont have account yet
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: style.copyWith(color: AppColor.darkGrey),
                            ),
                            const SizedBox(width: 3),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignUp(),
                                ),
                              ),
                              child: Text(
                                'Sign Up',
                                style: style.copyWith(color: AppColor.orange),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
