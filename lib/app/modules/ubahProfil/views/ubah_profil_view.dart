import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubah_profil_controller.dart';

class UbahProfilView extends GetView<UbahProfilController> {
  const UbahProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF62C172),
        title: const Text(
          'Ubah Profil',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                print('ketekan');
              },
              child: Center(
                child: CircleAvatar(
                  backgroundImage:
                      const AssetImage('assets/images/profile.png'),
                  radius: 50,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Center(
                        child: Image.asset('assets/images/camera.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                textProfileDisplay('Nama Lengkap', 'Febry Twenido'),
                textProfileDisplay('Email', 'febrytwenido@gmail.com'),
                textProfileDisplay('Alamat', 'Jl. Sukabirus'),
                textProfileDisplay('Nomor Telepon', '0812 3456 7890'),
              ],
            ),
            const SizedBox(
              height: 176,
            ),
            GestureDetector(
              onTap: () {
                print('ketekan');
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF74DA74),
                  ),
                  height: 48,
                  width: 164,
                  child: const Center(
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textProfileDisplay(String text, String data) {
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
        const Divider(
          color: Color(0xFFAAAAAA),
          thickness: 1,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
