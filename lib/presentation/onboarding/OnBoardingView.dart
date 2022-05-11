import 'package:afalmi/presentation/app_resources/assets_manager.dart';
import 'package:afalmi/presentation/app_resources/color_manager.dart';
import 'package:afalmi/presentation/app_resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<OnBoardingSlider> _provideSliders() => [
        OnBoardingSlider(
            title: AppStrings.onBoardingTitle1,
            subtitle: AppStrings.onBoardingSubtitle1,
            icon: ImageAssets.onBoardingOne),
        OnBoardingSlider(
            title: AppStrings.onBoardingTitle2,
            subtitle: AppStrings.onBoardingSubtitle2,
            icon: ImageAssets.onBoardingTwo),
        OnBoardingSlider(
            title: AppStrings.onBoardingTitle3,
            subtitle: AppStrings.onBoardingSubtitle3,
            icon: ImageAssets.onBoardingThree)
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: PageView.builder(
          controller: _pageController,
          itemCount: _provideSliders().length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, builder) => Container()),
    );
  }
}

class OnBoardingSlider {
  final String title;
  final String subtitle;
  final String icon;

  OnBoardingSlider(
      {required this.title, required this.subtitle, required this.icon});
}
