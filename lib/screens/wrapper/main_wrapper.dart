import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streak_push/screens/pages/home_page.dart';
import 'package:streak_push/utility/constants.dart';
import '../pages/settings_page.dart';

class MainWrapperController extends GetxController {
  var selectedIndex = 0.obs;
  PageController pageController = PageController();

  void changeIndex(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    update();
  }
}

class MainWrapper extends StatelessWidget {
  final List<Widget> _pages = [
    MyHomePage(),
    MySettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainWrapperController>(
      init: MainWrapperController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: primaryColor,
          body: PageView(
            controller: controller.pageController,
            children: _pages,
            onPageChanged: (index) {
              controller.selectedIndex.value = index;
              controller.update();
            },
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Theme(
              data: ThemeData(
                // splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              child: BottomNavigationBar(
                // enableFeedback: true,
                type: BottomNavigationBarType.fixed,
                backgroundColor: secondaryColor,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      controller.selectedIndex == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      color: controller.selectedIndex == 0
                          ? Colors.white
                          : Colors.grey,
                      size: 25,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      controller.selectedIndex == 1
                          ? Icons.settings
                          : Icons.settings_outlined,
                      color: controller.selectedIndex == 1
                          ? Colors.white
                          : Colors.grey,
                      size: 25,
                    ),
                    label: "",
                  ),
                ],
                currentIndex: controller.selectedIndex.value,
                selectedItemColor: Colors.white,
                onTap: (index) {
                  controller.changeIndex(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
