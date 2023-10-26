import 'package:firebase_chat/common/routes/pages.dart';
import 'package:firebase_chat/common/services/services.dart';
import 'package:firebase_chat/common/store/store.dart';
import 'package:firebase_chat/firebase_options.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import "package:get/get.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
