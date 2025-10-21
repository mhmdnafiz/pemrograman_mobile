class Dosen {
  final String id;
  final String nama;
  final String nip;
  final String email;
  final String jabatan;
  final String bidang;
  final String pendidikan;
  final String foto;
  final String deskripsi;
  final List<String> mataKuliah;

  Dosen({
    required this.id,
    required this.nama,
    required this.nip,
    required this.email,
    required this.jabatan,
    required this.bidang,
    required this.pendidikan,
    required this.foto,
    required this.deskripsi,
    required this.mataKuliah,
  });
}

// Data dummy dosen
List<Dosen> dummyDosen = [
  Dosen(
    id: '1',
    nama: 'AHMAD NASUKHA, S.Hum., M.S.I',
    nip: '(1988072220171009)',
    email: 'ahmad.nasukha@uinjambi.ac.id',
    jabatan: 'Dosen Tetap',
    bidang: 'Artificial Intelligence',
    pendidikan: 'S2 Computer Science - Universitas Indonesia',
    foto: 'assets/profil/dosen1.jpg', // Ganti dengan path foto yang sesuai
    deskripsi:
        'sangat menguasai di bidang pemrograman, dan penggunaan AI tertuma Gemini AI.',
    mataKuliah: [
      'Kecerdasan Buatan',
      'Machine Learning',
      'Data Mining',
      'Pemrograman Python'
    ],
  ),
  Dosen(
    id: '2',
    nama: 'DILA NURLAILA, M.Kom ',
    nip: '1571015201960020',
    email: 'dilanurlaila@university.ac.id',
    jabatan: 'Dosen Tetap',
    bidang: 'Rekayasa Perangkat Lunak',
    pendidikan: 'S2 Information Technology - Institut Teknologi Bandung',
    foto: 'assets/profil/dosen2.jpg',
    deskripsi:
        'Ahli dalam bidang Rekayasa Perangkat Lunak, dan Penuh Dengan PlotTwist',
    mataKuliah: [
      'RPL',
      'Big Data Analytics',
      'Statistika Komputasi',
      'Basis Data'
    ],
  ),
];
