import 'package:flutter/material.dart';
import 'package:flutterperpus/Tampilan2Cloud/main23cloud.dart';
import 'package:flutterperpus/Tampilan2Java/mainjava.dart';
import 'package:flutterperpus/Tampilan2Pemrograman/judul.dart';
import 'package:flutterperpus/Tampilan2Pemrograman/main2pemrograman.dart';
import 'package:flutterperpus/Tampilan2Web/mainweb.dart';

void main() {
  runApp(Kategori());
}

// Define your color constants
Color primaryColor = Color.fromARGB(255, 97, 130, 100);
Color backgroundColor = Color.fromARGB(255, 208, 231, 210);
Color cardColor1 = Color.fromARGB(255, 145, 179, 146);
Color cardColor2 = Color.fromARGB(255, 119, 157, 122);

class Kategori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Kategori Buku',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
        ),
        body: CategoryGrid(),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Container(
            height: 550,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Judul(),
                  SizedBox(height: 20),
                  Text(
                    "Selamat datang di Kategori Buku! Pilihlah kategori yang Anda minati dan temukan berbagai jenis buku yang menarik.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 4 : 2,
                      padding: EdgeInsets.all(16.0),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        CategoryCard(
                          title: 'WEB',
                          color: cardColor1,
                          icon: Icons.language,
                          navigateTo: Mainweb(),
                        ),
                        CategoryCard(
                          title: 'DATABASE',
                          color: cardColor2,
                          icon: Icons.storage,
                          navigateTo: Mainpemrograman(),
                        ),
                        CategoryCard(
                          title: 'CLOUD',
                          color: cardColor2,
                          icon: Icons.cloud,
                          navigateTo: Maincloud(),
                        ),
                        CategoryCard(
                          title: 'JAVA',
                          color: cardColor2,
                          icon: Icons.coffee,
                          navigateTo: MainJava(),
                        ),
                      ],
                    ),
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

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Widget navigateTo;

  CategoryCard({
    required this.title,
    required this.color,
    required this.icon,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Aksi yang ingin dilakukan ketika item diklik
          print('Kategori: $title');

          // Navigasi ke halaman yang dipilih
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 50.0,
                color: Colors.white,
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
