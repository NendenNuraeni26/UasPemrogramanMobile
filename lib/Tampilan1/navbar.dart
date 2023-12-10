import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sinau Kaca",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 235, 241, 246),
              letterSpacing: 2.0,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Apa Buku Yang Akan Kamu Cari?",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              ClipOval(
                child: Image.network(
                  "https://i.ibb.co/B6bR8Gw/1.jpg",
                  fit: BoxFit.cover,
                  width: 70, // Lebar gambar lingkaran
                  height: 70, // Tinggi gambar lingkaran
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
