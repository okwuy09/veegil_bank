import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:veegil_bank/authentication/signin.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/style.dart';
import 'package:veegil_bank/widget/button.dart';
import 'package:veegil_bank/widget/navigation_box.dart';
import 'package:veegil_bank/widget/textform.dart';

import '../service/provider.dart';
import '../widget/bottom_navbar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

TextEditingController _phoneField = TextEditingController();
TextEditingController _passwordField = TextEditingController();

class _SignUpState extends State<SignUp> {
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
                          onTap: () => Navigator.pop(context),
                        ),

                        SizedBox(height: screensize.height * 0.08),

                        Row(
                          children: [
                            Text(
                              'Create a',
                              style: style.copyWith(
                                fontSize: 24.0,
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              'Veegil',
                              style: style.copyWith(
                                fontSize: 24.0,
                                color: AppColor.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'account',
                          style: style.copyWith(
                            fontSize: 24.0,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
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
                          validatior: (input) =>
                              (input!.isEmpty) ? "Enter phone number" : null,
                        ),

                        SizedBox(height: screensize.height * 0.02),
                        // signin password form
                        MyTextForm(
                          obscureText: _isObscure,
                          controller: _passwordField,
                          hintText: 'Password',
                          validatior: (input) =>
                              (input!.isEmpty) ? "Enter password" : null,
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
                        SizedBox(height: screensize.height * 0.1),

                        MainButton(
                          text: provider.isSignUp
                              ? buttonCircularIndicator
                              : Text(
                                  'Sign Up',
                                  style: style.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColor.white,
                                  ),
                                ),
                          backgroundColor: AppColor.primaryColor,
                          onTap: () async {
                            if (_globalFormKey.currentState!.validate()) {
                              var res = await provider.signUp(
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
                              'Already have an account?',
                              style: style.copyWith(color: AppColor.darkGrey),
                            ),
                            const SizedBox(width: 3),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignIn(),
                                ),
                              ),
                              child: Text(
                                'Sign In',
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

    // Scaffold(
    //   backgroundColor: AppColor.white,
    //   body: ListView(
    //     children: [
    //       Form(
    //         key: _globalFormKey,
    //         child: Column(
    //           children: [
    //             Padding(
    //               padding:
    //                   const EdgeInsets.only(left: 24.0, right: 24.0, top: 20),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   //page navigation button
    //                   NavigationBox(onTap: () => Navigator.pop(context)),

    //                   SizedBox(height: screensize.height * 0.05),

    //                   SizedBox(height: screensize.height * 0.04),
    //                   // sign up full name form
    //                   MyTextForm(
    //                     obscureText: false,
    //                     //labelText: 'Full name',
    //                     controller: _fullName,
    //                     validatior: (input) =>
    //                         input!.isEmpty ? "Please enter fullname" : null,
    //                   ),
    //                   SizedBox(height: screensize.height * 0.02),
    //                   // sign up email form
    //                   MyTextForm(
    //                     obscureText: false,
    //                     // labelText: 'Email',
    //                     controller: _emailField,
    //                     validatior: (input) => !(input?.contains('@') ?? false)
    //                         ? "Please enter valid Email"
    //                         : null,
    //                   ),

    //                   SizedBox(height: screensize.height * 0.02),
    //                   // sign up password form
    //                   MyTextForm(
    //                     obscureText: _isObscure,
    //                     controller: _passwordField,
    //                     //labelText: 'Password',
    //                     validatior: (value) {
    //                       bool passValid =
    //                           RegExp("^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).*")
    //                               .hasMatch(value!);
    //                       if (value.isEmpty || !passValid) {
    //                         return 'Please enter Valid Pasword*';
    //                       }
    //                       return null;
    //                     },
    //                     // (input != null && input.length < 6)
    //                     //     ? "Password should be more than 5 characters"
    //                     //     : null,
    //                     suffixIcon: IconButton(
    //                       icon: Icon(
    //                         _isObscure
    //                             ? Icons.visibility_outlined
    //                             : Icons.visibility_off_outlined,
    //                         color: AppColor.darkGrey,
    //                       ),
    //                       onPressed: () {
    //                         if (_globalFormKey.currentState!.validate()) {
    //                           setState(
    //                             () {
    //                               _isObscure = !_isObscure;
    //                             },
    //                           );
    //                         }
    //                       },
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),

    //             SizedBox(height: screensize.height * 0.03),
    //             // navigate to sign in page, if you have account already
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    //                   child: MainButton(
    //                     text: 'Sign Up',
    //                     //provider.getTokenloading ? 'Loading...' : 'Sign Up',
    //                     backgroundColor: AppColor.primaryColor,
    //                     textColor: AppColor.white,
    //                     onTap: () async {
    //                       // final prefs = await SharedPreferences.getInstance();
    //                       // prefs.setString('email', _emailField.text);
    //                       // prefs.setString('password', _passwordField.text);
    //                       // prefs.setString('name', _fullName.text);
    //                       // setState(() {});
    //                       // await _getToken();
    //                     },
    //                   ),
    //                 )
    //               ],
    //             ),

    //             SizedBox(height: screensize.height * 0.05),
    //             // divider with centered 'OR'.
    //             Padding(
    //               padding: const EdgeInsets.only(left: 24, right: 24),
    //               child: Row(
    //                 children: [
    //                   Expanded(child: Divider(color: AppColor.grey)),
    //                   const SizedBox(width: 12),
    //                   Text(
    //                     'OR',
    //                     style: style.copyWith(
    //                         fontSize: 14, color: AppColor.darkGrey),
    //                   ),
    //                   const SizedBox(width: 12),
    //                   Expanded(child: Divider(color: AppColor.grey)),
    //                 ],
    //               ),
    //             ),

    //             // Sign in with google 0r apple
    //             SizedBox(height: screensize.height * 0.05),
    //             Padding(
    //               padding: const EdgeInsets.only(left: 24, right: 24),
    //               child: Row(
    //                 children: [
    //                   InkWell(
    //                     child: const SocialContainer(
    //                       image: AssetImage('assets/google_icon.png'),
    //                     ),
    //                     onTap: () {},
    //                   ),
    //                 ],
    //               ),
    //             ),

    //             SizedBox(height: screensize.height * 0.07),

    //             Padding(
    //               padding: const EdgeInsets.only(left: 24, right: 24),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     'Already have an account?',
    //                     style: style.copyWith(color: AppColor.darkGrey),
    //                   ),
    //                   const SizedBox(width: 3),
    //                   InkWell(
    //                     onTap: () => Navigator.pushReplacement(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (_) => const SignIn(),
    //                       ),
    //                     ),
    //                     child: Text(
    //                       'Sign In',
    //                       style: style.copyWith(color: AppColor.orange),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
