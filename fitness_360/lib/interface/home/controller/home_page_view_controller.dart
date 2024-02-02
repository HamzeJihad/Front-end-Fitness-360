import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/home/service/home_service.dart';

class HomePageViewController extends GetxController {
  HomePageViewController({int? index}) {
    if (index != null) {
      currentPage.value = index;
      homePageController = PageController(initialPage: index, keepPage: false);
    } else {
      homePageController = PageController(initialPage: 0, keepPage: false);
    }
  }
  RxInt currentPage = RxInt(0);
  final homeService = Get.find<HomeService>();

  PageController? homePageController;
  num quantidadeMinimaTreino = 0;
  RxBool isIndexActive(int page) => (page == currentPage.value).obs;

  void getAllTraining() {
    homeService.getTraining().then((value) {});
  }

  void pageChangeListener(int page) {
    currentPage.value = page;
  }

  void goToPage(int index) {
    if (index >= 0 && index <= 4) {
      currentPage.value = index;
      if (homePageController != null) {
        homePageController?.jumpToPage(index);
      }
    }
  }
}
