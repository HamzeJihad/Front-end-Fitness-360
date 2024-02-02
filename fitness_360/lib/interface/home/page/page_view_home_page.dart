import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/assessments/assessments_page.dart';
import 'package:fitness_360/interface/cardio/cardio_screen.dart';
import 'package:fitness_360/interface/home/controller/home_page_view_controller.dart';
import 'package:fitness_360/interface/profile_page.dart';
import 'package:fitness_360/interface/training/training_page.dart';

class PageViewHomePage extends StatefulWidget {
  const PageViewHomePage({Key? key}) : super(key: key);

  @override
  State<PageViewHomePage> createState() => _PageViewHomePageState();
}

class _PageViewHomePageState extends State<PageViewHomePage> {
  var pagesAvailable = {
    'student': [
      const TrainingPage(),
      const CardioScreen(),
      const AssessmentsPage(),
      const ProfilePage()
    ],
  };

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewController>(
        init: HomePageViewController(),
        builder: (controller) {
          return PageView(
            controller: controller.homePageController,
            onPageChanged: controller.pageChangeListener,
            children: pagesAvailable['student']!,
          );
        });
  }
}
