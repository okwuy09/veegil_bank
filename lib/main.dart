import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank/authentication/signin.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/service/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Data()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Veegil Bank',
      theme: ThemeData(
        primaryColor: AppColor.white,
        //primarySwatch: Colors.green,
      ),
      home: const SignIn(),
    );
  }
}
