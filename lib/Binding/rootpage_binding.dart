import 'package:get/get.dart';
import 'package:tu_dien_dong_vat/Controller/rootpage_controller.dart';

class RootPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootPageController());
  }
}
