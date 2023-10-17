import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'post_details_controller.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({Key? key, required this.controller})
      : super(key: key);

  static const routeName = '/postDetails';
  static GetPage getPage() => GetPage(
      name: routeName,
      page: () => PostDetailsScreen.create(),
      curve: Curves.easeInOut,
      title: '/postDetails',
      transition: Transition.cupertino);

  static PostDetailsScreen create() =>
      PostDetailsScreen(controller: Get.put(PostDetailsController()));

  final PostDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => Text(
              controller.details.value.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(context.width * 0.1),
            child: Obx(() => detailsBody(context))),
      ),
    );
  }

  Widget detailsBody(BuildContext context) {
    return Column(
      children: [
        /// TITLE
        Text(
          controller.details.value.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),

        /// Spacing between title and body according to screen height
        SizedBox(height: context.height * 0.05),

        /// Body
        Text(
          controller.details.value.body,
          style: const TextStyle(color: Colors.black54),
        )
      ],
    );
  }
}
