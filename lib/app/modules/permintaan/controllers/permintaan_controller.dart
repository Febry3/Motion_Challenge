import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PermintaanController extends GetxController {
  //TODO: Implement PermintaanController

  void sendData(String nama, String deskripsi, String kategori, int harga,
      int jumlah, int durasi, int berat) {
    final data = {
      'berat': berat,
      'deskripsi': deskripsi,
      'durasi': durasi,
      'harga': harga,
      'isProses': false,
      'jumlah': jumlah,
      'kategori': kategori,
      'nama': nama,
    };
    FirebaseFirestore.instance
        .collection('user1')
        .doc('o4xgOYqPwhMCs4d6EFin')
        .collection('produkuser1')
        .doc()
        .set(data)
        .onError((e, _) => print("Error writing document: $e"));
    ;
  }
}
