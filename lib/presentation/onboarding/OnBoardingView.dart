import 'package:afalmi/presentation/app_resources/assets_manager.dart';
import 'package:afalmi/presentation/app_resources/color_manager.dart';
import 'package:afalmi/presentation/app_resources/strings_manager.dart';
import 'package:afalmi/presentation/app_resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: ColorManager.whitecolor,
      body: SafeArea(
        child: PageView.builder(
            controller: _pageController,
            itemCount: _provideSliders().length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, builder) => OnBoardingPage(
                onBoardingSlider: _provideSliders()[_currentIndex])),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final OnBoardingSlider onBoardingSlider;

  const OnBoardingPage({Key? key, required this.onBoardingSlider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPaddings.p24),
      child: Column(
        children: [
          SvgPicture.asset(onBoardingSlider.icon),
          const SizedBox(height: AppPaddings.p34),
          Text(
            onBoardingSlider.title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: ColorManager.grey),
          ),
          const SizedBox(height: AppPaddings.p34),
          Text(onBoardingSlider.subtitle,
              style: Theme.of(context).textTheme.caption?.copyWith(
                  color: ColorManager.greySubtitle, fontSize: AppSizes.s13),
              textAlign: TextAlign.center)
        ],
      ),
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
