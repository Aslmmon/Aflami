import 'dart:async';

import 'package:afalmi/presentation/app_resources/routes_manager.dart';
import 'package:afalmi/presentation/app_resources/assets_manager.dart';
import 'package:afalmi/presentation/app_resources/constants_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), goNext);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(ImageAssets.splashLogo)));
  }

  void goNext() =>
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
}
