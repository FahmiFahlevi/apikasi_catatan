class CatatanModel {
  String nama;
  String deskripsi;
  bool done;

  CatatanModel(this.nama, this.deskripsi, {this.done = false});

  static List<CatatanModel> dummyData = [
    CatatanModel("Latihan Menggambar", "Latihan Perlombaan"),
    CatatanModel("Latihan Menggambar", "Latihan Perlombaan",done: true),
    CatatanModel("Latihan Menggambar", "Latihan Perlombaan"),
  ];
}
