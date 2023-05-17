import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';
import 'home/provider/setting_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getSplashScreen()),
              fit: BoxFit.fill)),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
