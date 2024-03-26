import 'package:get/get.dart';

class AppIntroController extends GetxController {
  var currentPageIndex = 0.obs;

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }
}

class PageModel {
  final String image;
  final String title;
  final String description;

  PageModel({
    required this.image,
    required this.title,
    required this.description,
    required color,
  });
}
