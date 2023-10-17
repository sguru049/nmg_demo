import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '/Models/post_model.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/home';
  static GetPage getPage() => GetPage(
      name: routeName,
      page: () => HomeScreen.create(),
      curve: Curves.easeInOut,
      title: '/home',
      transition: Transition.cupertino);

  static HomeScreen create() =>
      HomeScreen(controller: Get.put(HomeScreenController()));

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors',
            style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Obx(() {
            return RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      ListTile(data: controller.posts.value[index]),
                  itemCount: controller.posts.value.length,
                ),
                onRefresh: () async {
                  controller.getAuthors();
                });
          }),
        ),
      ),
    );
  }
}

class ListTile extends StatelessWidget {
  ListTile({super.key, required this.data});

  final Post data;
  final HomeScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.onItemTap(data.id);
      },
      child: Container(
        padding: EdgeInsets.all(context.width * 0.05),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              controller
                  .authors[
                      controller.authors.indexWhere((e) => e.id == data.userId)]
                  .name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: context.width * 0.02),
            Text(data.title),
          ],
        ),
      ),
    );
  }
}
