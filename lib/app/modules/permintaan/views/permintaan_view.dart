import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/permintaan_controller.dart';

class PermintaanView extends GetView<PermintaanController> {
  const PermintaanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PermintaanController());
    return GetBuilder<PermintaanController>(builder: (controller) {
      final textNamaProdukController = TextEditingController();
      final textDeskripsiController = TextEditingController();
      final textKategoriController = TextEditingController();
      final textHargaController = TextEditingController();
      final textJumlahController = TextEditingController();
      final textDurasiTahanController = TextEditingController();
      final textBeratController = TextEditingController();
      return Scaffold(
        backgroundColor: Color(0xFFE8F9E8),
        appBar: AppBar(
          title: const Text(
            'Kirim Permintaan',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF62C172),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Foto Produk',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 102,
                width: 106,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(CupertinoIcons.photo_camera),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Nama Produk',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: textNamaProdukController,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Deskripsi Produk',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: textDeskripsiController,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Kategori',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: textKategoriController,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Harga',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: textHargaController,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Jumlah',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: textJumlahController,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Durasi Tahan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: textDurasiTahanController,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Berat (Gram) (contoh: 500g)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: textBeratController,
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () {
                  print(textBeratController.text);
                  controller.sendData(
                      textNamaProdukController.text,
                      textDeskripsiController.text,
                      textKategoriController.text,
                      int.parse(textHargaController.text),
                      int.parse(textJumlahController.text),
                      int.parse(textDurasiTahanController.text),
                      int.parse(textBeratController.text));
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
                        'Kirim',
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
    });
  }
}
