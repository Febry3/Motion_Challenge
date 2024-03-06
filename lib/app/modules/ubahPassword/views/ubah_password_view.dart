import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubah_password_controller.dart';

class UbahPasswordView extends GetView<UbahPasswordController> {
  const UbahPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF62C172),
        title: const Text(
          'Ubah Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password Lama',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFAAAAAA),
              ),
            ),
            TextField(
              obscureText: true,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Password Baru',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFAAAAAA),
              ),
            ),
            TextField(
              obscureText: true,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Konfirmasi Password Baru',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFAAAAAA),
              ),
            ),
            TextField(
              obscureText: true,
              style: TextStyle(fontSize: 18.0),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity - 74,
              ),
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
}
