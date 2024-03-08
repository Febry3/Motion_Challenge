import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class UbahProfilController extends GetxController {
  void updateHandler(id, newNama, newEmail, newAlamat, newTelepon, password) {
    final newData = {
      'nama': newNama,
      'email': newEmail,
      'alamat': newAlamat,
      'nomortelpon': newTelepon,
      'password': password,
    };

    FirebaseFirestore.instance.collection('user1').doc(id).set(newData);
  }
}
