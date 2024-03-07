import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motion_challenge/app/data/produk_model.dart';

import '../controllers/produk_controller.dart';

final Produk produk = Produk(
  nama: 'Brokoli',
  deskripsi: 'Brokoli segar',
  kategori: 'Sayuran',
  harga: 10000,
  jumlah: 20,
  durasi: 1,
  berat: 100,
  isProses: false,
);

class ProdukView extends GetView<ProdukController> {
  const ProdukView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color(0xFFE8F9E8),
          child: Column(
            children: [
              const ProdukAppBar(),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return ProdukCard(
                      input: produk,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProdukAppBar extends StatelessWidget {
  const ProdukAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 136,
      color: const Color(0xFF62C172),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Text(
                  'List Produk',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 45,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search_outlined,
                    size: 30,
                    color: Color(0xFFAAAAAA),
                  ),
                  hintText: 'Cari Produk',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
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

class ProdukCard extends StatelessWidget {
  final Produk input;

  const ProdukCard({super.key, required this.input});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 180,
      decoration: BoxDecoration(
        color: Color(0xFFD1F3D1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Container(
            height: 95,
            child: Image.asset('assets/images/brokoli.png', scale: 4),
          ),
          Container(
            width: double.infinity,
            height: 93.2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    input.nama,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    input.isProses ? 'Proses' : 'Selesai',
                    style: TextStyle(
                        fontSize: 12,
                        color: input.isProses ? Colors.orange : Colors.green),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF74DA74),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Detail',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
