import 'package:afalmi/domain/models.dart';
import 'package:afalmi/presentation/app_resources/color_manager.dart';
import 'package:afalmi/presentation/app_resources/values_manager.dart';
import 'package:afalmi/presentation/onboarding/OnBoardingViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();

  _bind() {
    _onBoardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _onBoardingViewModel.outputSliderView,
        builder: (context, snapshot)
    => snapshot.data ==null ? const SizedBox.shrink() :
        Scaffold(
          backgroundColor: ColorManager.whitecolor,
          body: SafeArea(
            child: PageView.builder(
              controller: _pageController,
              itemCount: (snapshot.data as SliderView).slidersLength,
              onPageChanged: (index) {
                _onBoardingViewModel.onPageChanged(index);
              },
              itemBuilder: (context, builder) =>
                  OnBoardingPage(
                      onBoardingSlider: (snapshot.data as SliderView)
                          .onBoardingSlider),
            ),
          ),
        ));
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
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: ColorManager.grey),
          ),
          const SizedBox(height: AppPaddings.p34),
          Text(onBoardingSlider.subtitle,
              style: Theme
                  .of(context)
                  .textTheme
                  .caption
                  ?.copyWith(
                  color: ColorManager.greySubtitle, fontSize: AppSizes.s13),
              textAlign: TextAlign.center)
        ],
      ),
    );
  }


}
