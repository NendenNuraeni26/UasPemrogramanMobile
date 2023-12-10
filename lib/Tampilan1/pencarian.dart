import 'package:flutter/material.dart';

class Pencarian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8), // Mengatur margin secara horizontal dan vertical
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Mengubah offset bayangan
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.search, color: Colors.grey),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Buku',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(
                  255, 97, 130, 100), // Warna latar belakang ikon
            ),
            margin: EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(Icons.mic, color: Colors.white), // Warna ikon
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
