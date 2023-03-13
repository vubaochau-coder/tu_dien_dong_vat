import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tu_dien_dong_vat/Binding/rootpage_binding.dart';
import 'package:tu_dien_dong_vat/Controller/rootpage_controller.dart';
import 'package:tu_dien_dong_vat/View/danh_sach_page.dart';
import 'package:tu_dien_dong_vat/View/main_page.dart';
import 'package:tu_dien_dong_vat/View/tro_choi_page.dart';
import 'package:tu_dien_dong_vat/View/yeu_thich_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Animal Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      initialBinding: RootPageBinding(),
    );
  }
}

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final RootPageController controller = Get.put(RootPageController());

  final List<Widget> pages = [
    DanhSachPage(),
    const YeuThichPage(),
    const TroChoiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          currentIndex: controller.currentIndex.value,
          unselectedItemColor: Colors.grey,
          onTap: (p0) {
            controller.changePage(p0);
          },
          items: [
            SalomonBottomBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.house,
                size: 18,
              ),
              title: const Text(
                'Danh sách',
              ),
            ),
            SalomonBottomBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.heart,
                size: 18,
              ),
              title: const Text(
                'Yêu thích',
              ),
            ),
            SalomonBottomBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.gamepad,
                size: 18,
              ),
              title: const Text(
                'Trò chơi',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
