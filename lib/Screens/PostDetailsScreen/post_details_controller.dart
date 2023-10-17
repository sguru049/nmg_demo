import 'package:get/get.dart';
import '/Services/nmg_web_services.dart';

import '/Models/post_details_model.dart';

class PostDetailsController extends GetxController {
  Rx<PostDetails> details =
      PostDetails(userId: 0, id: 0, title: '', body: '').obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments['id'] != null) {
        getDetails(Get.arguments['id']);
      }
    }
    super.onInit();
  }

  void getDetails(int id) async {
    NmgServices nmgServices = NmgServices();
    final value = await nmgServices.getPostDetails(id);
    if (value != null) {
      details.value = PostDetails.fromJson(value);
    }
  }
}
