import 'package:get/get.dart';

class RootPageController extends GetxController {
  static RootPageController get to => Get.find();

  var currentIndex = 0.obs;

  void changePage(int newIndex) {
    currentIndex.value = newIndex;
  }
}
