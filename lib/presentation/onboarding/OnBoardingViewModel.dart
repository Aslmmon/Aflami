import 'dart:async';

import 'package:afalmi/domain/models.dart';
import 'package:afalmi/presentation/app_resources/assets_manager.dart';
import 'package:afalmi/presentation/app_resources/strings_manager.dart';
import 'package:afalmi/presentation/base/BaseViewModel.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController = StreamController<SliderView>();
  late final List<OnBoardingSlider> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _provideSliders();
    _postDataToView();
  }

  @override
  int goNext() {
    int next = ++_currentIndex;
    if(next == _list.length){
      next = 0;
    }
    return next;
  }

  @override
  int goPrevious() {
    int previous = --_currentIndex;
    if(previous == -1){
      previous = _list.length -1;
    }
    return previous;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderView => _streamController.sink;

  @override
  Stream<SliderView> get outputSliderView =>
      _streamController.stream.map((sliderView) => sliderView);

  void _postDataToView() => inputSliderView.add(SliderView(_list[_currentIndex], _currentIndex, _list.length));


  List<OnBoardingSlider> _provideSliders() =>
      [
        OnBoardingSlider(
            title: AppStrings.onBoardingTitle1,
            subtitle: AppStrings.onBoardingSubtitle1,
            icon: ImageAssets.onBoardingOne),
        OnBoardingSlider(
            title: AppStrings.onBoardingTitle2,
            subtitle: AppStrings.onBoardingSubtitle2,
            icon: ImageAssets.onBoardingOne),
        OnBoardingSlider(
            title: AppStrings.onBoardingTitle3,
            subtitle: AppStrings.onBoardingSubtitle3,
            icon: ImageAssets.onBoardingThree)
      ];
}

// Actions needed
abstract class OnBoardingViewModelInputs {
  int goNext();

  int goPrevious();

  void onPageChanged(int index);

  Sink get inputSliderView;
}

// dat returned to update view
abstract class OnBoardingViewModelOutputs {
  Stream<SliderView> get outputSliderView;
}

class SliderView {
  final OnBoardingSlider onBoardingSlider;
  final int slidersLength;
  final int currentIndex;

  SliderView(this.onBoardingSlider, this.currentIndex, this.slidersLength);
}
