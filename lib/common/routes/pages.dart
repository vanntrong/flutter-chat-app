import 'package:firebase_chat/common/middlewares/middlewares.dart';
import 'package:firebase_chat/pages/application/index.dart';
import 'package:firebase_chat/pages/chat/index.dart';
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:firebase_chat/pages/photoview/index.dart';
import 'package:firebase_chat/pages/profile/bindings.dart';
import 'package:firebase_chat/pages/profile/view.dart';
import 'package:firebase_chat/pages/sign_in/bindings.dart';
import 'package:firebase_chat/pages/sign_in/view.dart';
import 'package:firebase_chat/pages/welcome/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APPlication = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => WelcomePage(),
        binding: WelcomeBinding(),
        middlewares: [RouteWelcomeMiddleware(priority: 1)]),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        // RouteAuthMiddleware(priority: 1),
      ],
    ),
    GetPage(
        name: AppRoutes.Contact,
        page: () => ContactPage(),
        binding: ContactBinding()),
    GetPage(
        name: AppRoutes.Chat, page: () => ChatPage(), binding: ChatBinding()),
    GetPage(
        name: AppRoutes.Photoimgview,
        page: () => PhotoImageView(),
        binding: PhotoViewBinding()),
    GetPage(
        name: AppRoutes.Me,
        page: () => ProfilePage(),
        binding: ProfileBinding())
/*
    GetPage(
        name: AppRoutes.Message,
        page: () => MessagePage(),
        binding: MessageBinding()),
    //我的
    //聊天详情
    */
  ];
}
