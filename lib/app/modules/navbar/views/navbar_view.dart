import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motion_challenge/app/modules/home/views/home_view.dart';
import 'package:motion_challenge/app/modules/produk/views/produk_view.dart';
import 'package:motion_challenge/app/modules/profile/views/profile_view.dart';
import 'package:motion_challenge/app/modules/riwayat/views/riwayat_view.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeView(),
              ProdukView(),
              RiwayatView(),
              ProfileView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF17C118),
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/home.png'),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/produk.png'),
              ),
              label: 'Produk',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/history.png'),
              ),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/profile-circle.png'),
              ),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
