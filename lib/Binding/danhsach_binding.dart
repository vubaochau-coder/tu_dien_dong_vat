import 'package:get/get.dart';
import 'package:tu_dien_dong_vat/Controller/danhsach_controller.dart';

class DanhSachBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DanhSachController());
  }
}
