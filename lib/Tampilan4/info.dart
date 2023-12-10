import 'package:flutter/material.dart';

void main() {
  runApp(InfoApp());
}

class InfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:
            Color.fromARGB(255, 97, 130, 100), // Ganti warna latar belakang
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      Color.fromARGB(255, 208, 231, 210), // Ganti warna konten
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 6,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 40,
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Icon(
                      Icons.info,
                      size: 64,
                      color: const Color.fromARGB(255, 97, 130, 100),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Selamat datang di Aplikasi Perpustakaan kami!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Aplikasi Perpustakaan kami adalah alat penting bagi para pecinta buku dan pembaca setia. Dengan fitur-fitur canggih dan koleksi buku yang luas, kami berkomitmen untuk memberikan pengalaman membaca yang luar biasa kepada pengguna kami.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Apa yang Anda dapatkan di Aplikasi Perpustakaan kami:",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "- Koleksi Buku Luas: Jelajahi ribuan judul dari berbagai genre, mulai dari fiksi, non-fiksi, sejarah, hingga ilmiah.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "- Kemudahan dalam Pencarian: Temukan buku yang Anda cari dengan cepat melalui mesin pencarian yang efisien.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "- Baca di Mana Saja: Akses koleksi buku kami kapan saja dan di mana saja melalui aplikasi mobile kami.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "- Penanda Buku: Tandai halaman favorit Anda dan simpan catatan pribadi saat membaca.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "- Info dan Panduan: Temukan berita terbaru, acara, dan panduan berguna tentang bagaimana memanfaatkan aplikasi kami sebaik mungkin.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
