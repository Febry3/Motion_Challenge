import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubah_profil_controller.dart';

class UbahProfilView extends GetView<UbahProfilController> {
  const UbahProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(UbahProfilController());
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
      body: GetBuilder<UbahProfilController>(
        builder: (controller) {
          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user1').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Tunggu');
              }

              if (snapshot.hasData == false) {
                return Text('Kosong');
              }

              final data = snapshot.data!.docs[0];

              final textNamaController =
                  TextEditingController(text: data['nama']);
              final textEmailController =
                  TextEditingController(text: data['email']);
              final textAlamatController =
                  TextEditingController(text: data['alamat']);
              final textTeleponController =
                  TextEditingController(text: data['nomortelpon']);

              return Padding(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Nama Lengkap',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                        TextField(controller: textNamaController),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                        TextField(
                          controller: textEmailController,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Alamat',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                        TextField(
                          controller: textAlamatController,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Telepon',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                        TextField(
                          controller: textTeleponController,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 176,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.updateHandler(
                            data.id,
                            textNamaController.text.trim() == ""
                                ? data['nama']
                                : textNamaController.text,
                            textEmailController.text.trim() == ""
                                ? data['email']
                                : textEmailController.text,
                            textAlamatController.text.trim() == ""
                                ? data['alamat']
                                : textAlamatController.text,
                            textTeleponController.text.trim() == ""
                                ? data['nomortelpon']
                                : textTeleponController.text,
                            data['password']);
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
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
