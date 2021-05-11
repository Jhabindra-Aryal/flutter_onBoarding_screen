import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/onBordingController.dart';
import 'package:shop_app/views/onBoardingPage.dart';

void main() {
  runApp(ChangeNotifierProvider<OnBoardingController>(
    create: (_) => OnBoardingController(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingPage(),
    );
  }
}
