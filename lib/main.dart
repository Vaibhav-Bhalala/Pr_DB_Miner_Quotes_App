import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Controller/theme_controller.dart';
import 'Views/Screens/category_page.dart';
import 'Views/Screens/favourite_screen.dart';
import 'Views/Screens/intro_screen.dart';
import 'Views/Screens/quotes_details_page.dart';
import 'Views/Screens/quotes_list_page.dart';
import 'Views/Screens/splash.dart';

void main() async {
  await GetStorage.init();
  final ThemeController _themeController = Get.put(ThemeController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeController.themeMode.value,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => IntroPage(),
        ),
        GetPage(
          name: "/splash",
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: "/Homepage",
          page: () => const HomePage(),
        ),
        GetPage(
          name: "/second",
          page: () => const second_page(),
        ),
        GetPage(
          name: "/edit",
          page: () => const Edit_page(),
        ),
        GetPage(
          name: "/FvtScreen",
          page: () => const FvtScreen(),
        ),
      ],
    ),
  );
}
