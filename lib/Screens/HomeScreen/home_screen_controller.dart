import 'package:get/get.dart';
import 'package:nmg_demo/Screens/PostDetailsScreen/post_details.dart';
import '/Services/nmg_web_services.dart';

import '/Models/post_model.dart';
import '/Models/authors_model.dart';

class HomeScreenController extends GetxController {
  RxList<Authors> authors = RxList<Authors>();
  RxList<Post> posts = RxList<Post>();

  @override
  void onInit() {
    getAuthors();
    super.onInit();
  }

  void getAuthors() async {
    NmgServices nmgServices = NmgServices();
    final List<dynamic>? value = await nmgServices.getAuthorsList();
    if (value != null) {
      if (value.isNotEmpty) {
        authors.value = value.map((e) => Authors.fromJson(e)).toList();
        getPosts();
      }
    }
  }

  void getPosts() async {
    NmgServices nmgServices = NmgServices();
    final List<dynamic>? value = await nmgServices.getPostsList();
    if (value != null) {
      if (value.isNotEmpty) {
        posts.value = value.map((e) => Post.fromJson(e)).toList();
      }
    }
  }

  void onItemTap(id) {
    Get.toNamed(PostDetailsScreen.routeName, arguments: {'id': id});
  }
}
