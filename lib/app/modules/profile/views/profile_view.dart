import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motion_challenge/app/modules/ubahPassword/views/ubah_password_view.dart';
import 'package:motion_challenge/app/modules/ubahProfil/views/ubah_profil_view.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileBar(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 136,
      color: const Color(0xFF62C172),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Image.asset('assets/images/profile.png'),
                ),
                const SizedBox(
                  width: 24,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cokorda Arturito',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Cokorda@gmail.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 24,
            ),
            IconButton(
              onPressed: () {
                Get.to(const UbahProfilView());
              },
              icon: Image.asset(
                'assets/images/brush.png',
                scale: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 36,
              ),
              textDisplay('Nama Lengkap', 'Febry'),
              textDisplay('Email', 'febrytwenido@gmail.com'),
              textDisplay('Nomor Telepon', '0812 3456 7890'),
              textDisplay('Alamat', 'Jl. Sukabirus'),
              const Divider(
                color: Color(0xFFE1E1E1),
                thickness: 2,
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Keamanan',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const UbahPasswordView());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ubah Password',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color(0xFFE1E1E1),
                thickness: 2,
              ),
              const SizedBox(
                height: 36,
              ),
              GestureDetector(
                onTap: () {
                  print('ketekan');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logout.png',
                      scale: 3.5,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      'Logout Akun',
                      style: TextStyle(color: Color(0xFF129B29), fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textDisplay(String text, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFFAAAAAA),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          data,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
