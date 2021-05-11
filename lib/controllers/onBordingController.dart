import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/onBoarding_Info.dart';

class OnBoardingController extends GetxController {
  RxInt selectedPageIndex = 0.obs;
  PageController pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  fordartAction() {
    if (isLastPage) {
    } else
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
        'https://images.pexels.com/photos/5709661/pexels-photo-5709661.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'ABC Shop',
        'Shop for clothes'),
    OnBoardingInfo(
        'https://images.pexels.com/photos/994523/pexels-photo-994523.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'Shop More',
        'If you want it, buy it.'),
    OnBoardingInfo(
        'https://images.pexels.com/photos/3965559/pexels-photo-3965559.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'Shop More',
        'If you want it, buy it.'),
  ];
}
