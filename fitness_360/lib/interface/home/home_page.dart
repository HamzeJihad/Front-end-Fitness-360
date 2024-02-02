// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/home/controller/home_page_view_controller.dart';
import 'package:fitness_360/interface/home/page/page_view_home_page.dart';
import 'package:fitness_360/models/bottom_menu_itens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageViewController homePageViewController;

  @override
  void initState() {
    super.initState();
    homePageViewController = Get.isRegistered<HomePageViewController>()
        ? Get.find<HomePageViewController>()
        : Get.put(HomePageViewController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PageViewHomePage(),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xFFDCDDDF))),
            color: Colors.white,
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: BottomMenuItem(
                    active: homePageViewController.isIndexActive(0).isTrue,
                    icon: Icons.sports_gymnastics_outlined,
                    onTap: () {
                      homePageViewController.goToPage(0);
                    },
                    text: 'Treinos',
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: BottomMenuItem(
                    active: homePageViewController.isIndexActive(1).isTrue,
                    icon: Icons.running_with_errors_outlined,
                    onTap: () {
                      homePageViewController.goToPage(1);
                    },
                    text: 'Cardio',
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: BottomMenuItem(
                    active: homePageViewController.isIndexActive(2).isTrue,
                    icon: Icons.assessment_outlined,
                    onTap: () {
                      homePageViewController.goToPage(2);
                    },
                    text: 'Evolução física',
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: BottomMenuItem(
                    active: homePageViewController.isIndexActive(3).isTrue,
                    icon: Icons.person_2_outlined,
                    onTap: () {
                      homePageViewController.goToPage(3);
                    },
                    text: 'Perfil',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
