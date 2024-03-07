import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motion_challenge/app/data/produk_model.dart';
import 'package:motion_challenge/app/data/user_model.dart';

class ProfileController extends GetxController {
  // Produk dataProduk = Produk(
  //     nama: 'Brokoli',
  //     deskripsi: 'Brokoli segar',
  //     kategori: 'Sayuran',
  //     harga: 10000,
  //     jumlah: 1,
  //     durasi: 1,
  //     berat: 200);

  User user = User(
    nama: 'Febry asdaas',
    email: 'febry@gmail.com',
    nomortelepon: '081234567890',
    alamat: 'Jl. Sukabirus',
    password: '123',
  );

  void perubahan() {
    user.nama = 'adhasad';
    final users = FirebaseFirestore.instance.collection("user1");

    print(users);
    update();
  }
}
