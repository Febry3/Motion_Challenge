class Produk {
  String nama;
  String deskripsi;
  String kategori;
  int harga;
  int jumlah;
  int durasi;
  int berat;
  bool isProses;

  Produk({
    required this.nama,
    required this.deskripsi,
    required this.kategori,
    required this.harga,
    required this.jumlah,
    required this.durasi,
    required this.berat,
    this.isProses = true,
  });
}
