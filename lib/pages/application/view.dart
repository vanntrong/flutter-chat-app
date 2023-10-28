import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/pages/application/index.dart';
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:firebase_chat/pages/message/view.dart';
import 'package:firebase_chat/pages/profile/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView() {
      return PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handlePageChanged,
        children: const [
          Center(
            child: MessagePage(),
          ),
          ContactPage(),
          Center(
            child: ProfilePage(),
          ),
        ],
      );
    }

    ;

    Widget _buildBottomNavigationBar() {
      return Obx((() => BottomNavigationBar(
            items: controller.bottomTabs,
            currentIndex: controller.state.page,
            type: BottomNavigationBarType.fixed,
            onTap: controller.handleNavbarTap,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedItemColor: AppColors.tabBarElement,
            selectedItemColor: AppColors.thirdElement,
          )));
    }

    ;

    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
