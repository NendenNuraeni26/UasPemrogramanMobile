import 'package:flutter/material.dart';
import 'package:flutterperpus/Tampilan4/about.dart';
import 'package:flutterperpus/Tampilan4/bantuan.dart';
import 'package:flutterperpus/Tampilan4/info.dart';
import 'package:flutterperpus/peminjaman/mainpeminjaman.dart';

class KategoriApp extends StatelessWidget {
  const KategoriApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            Text(
              "Menu    ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavigationIcon(
                icon: Icons.book,
                title: "Pinjam Buku",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pinjam()),
                  );
                },
              ),
              NavigationIcon(
                  icon: Icons.info,
                  title: "Info",
                  onTap: () {
                    // // Navigasi ke halaman Info
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoApp()));
                  }),
              NavigationIcon(
                  icon: Icons.help,
                  title: "Bantuan",
                  onTap: () {
                    // Navigasi ke halaman Profile
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bantuan()));
                  }),
              NavigationIcon(
                  icon: Icons.business,
                  title: "About",
                  onTap: () {
                    // Navigasi ke halaman Profile
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

class NavigationIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const NavigationIcon({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Tambahkan tindakan ketika ikon ditekan
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 7, 10),
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 97, 130, 100),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
