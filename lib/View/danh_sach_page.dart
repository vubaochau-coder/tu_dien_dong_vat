import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tu_dien_dong_vat/Controller/danhsach_controller.dart';
import 'package:tu_dien_dong_vat/Model/animal_icon_model.dart';
import 'package:tu_dien_dong_vat/View/animal_info.dart';
import 'package:tu_dien_dong_vat/View/animal_item.dart';

class DanhSachPage extends StatelessWidget {
  DanhSachPage({super.key});

  final DanhSachController controller = Get.put(DanhSachController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DanhSachController>(
      init: DanhSachController(),
      builder: (controller) {
        controller.getData();
        return SafeArea(
          child: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    return builtAnimalItem(
                        context, controller.animalList[index]);
                  },
                  itemCount: controller.animalList.length,
                  padding: const EdgeInsets.all(10),
                ),
        );
      },
    );
  }

  Widget builtAnimalItem(BuildContext context, AnimalIconModel data) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const AnimalInfomationPage();
            },
          ),
        );
      },
      child: AnimalItem(data: data),
    );
  }
}
