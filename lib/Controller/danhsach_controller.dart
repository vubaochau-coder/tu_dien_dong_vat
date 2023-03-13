import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tu_dien_dong_vat/Model/animal_icon_model.dart';

class DanhSachController extends GetxController {
  var animalList = <AnimalIconModel>[];
  var isLoading = true;

  Future<void> getData() async {
    try {
      final query =
          await FirebaseFirestore.instance.collection('Animal Icon').get();
      animalList.clear();
      for (var ele in query.docs) {
        animalList.add(
          AnimalIconModel.fromSnapshot(ele),
        );
      }
      isLoading = false;
      update();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        duration: const Duration(seconds: 10),
      );
    }
  }
}
