import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motion_challenge/app/data/produk_model.dart';
import 'package:motion_challenge/app/modules/permintaan/views/permintaan_view.dart';

import '../controllers/produk_controller.dart';

class ProdukView extends GetView<ProdukController> {
  const ProdukView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 10,
        backgroundColor: const Color(0xFF62C172),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(() => const PermintaanView());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          children: [
            const ProdukAppBar(),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('user1')
                  .doc('o4xgOYqPwhMCs4d6EFin')
                  .collection('produkuser1')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Tunggu');
                }

                if (snapshot.hasData == false) {
                  return Text('Kosong');
                }

                final data = snapshot.data!.docs;

                return GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProdukCard(
                      nama: data[index]['nama'],
                      isProses: data[index]['isProses'],
                    );
                  },
                );
              },
            ),
          ],
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
  final nama;
  final isProses;

  const ProdukCard({
    super.key,
    this.nama,
    this.isProses,
  });

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
                    nama,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    isProses ? 'Proses' : 'Selesai',
                    style: TextStyle(
                        fontSize: 12,
                        color: isProses ? Colors.orange : Colors.green),
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
