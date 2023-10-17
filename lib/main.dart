import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'Screens/HomeScreen/home_screen.dart';
import 'Screens/PostDetailsScreen/post_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyMaterialApp();
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NMG Demo',
      enableLog: false,
      initialRoute: HomeScreen.routeName,
      getPages: [
        HomeScreen.getPage(),
        PostDetailsScreen.getPage(),
      ],
    );
  }
}
