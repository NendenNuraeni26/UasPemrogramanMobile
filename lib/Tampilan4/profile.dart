import 'package:flutter/material.dart';

void main() {
  runApp(Profilee());
}

class Profilee extends StatefulWidget {
  Profilee({Key? key}) : super(key: key);

  @override
  _ProfileeState createState() => _ProfileeState();
}

class _ProfileeState extends State<Profilee> {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 176, 217, 177),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            buildTop(),
            buildContent(),
            builddescription(),
          ],
        ),
      ),
    );
  }

  Widget builddescription() => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                'Nenden Nuraeni adalah seorang individu yang dengan antusiasme dan semangat belajar yang tinggi telah bergabung sebagai anggota perpustakaan. Keputusannya untuk menjadi member perpustakaan menunjukkan dedikasinya terhadap pengetahuan dan literasi. Dengan keanggotaannya, Nenden Nuraeni memiliki akses ke berbagai sumber informasi yang bermanfaat, mulai dari buku cetak hingga sumber digital.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'Nenden Nuraeni adalah seorang individu yang dengan antusiasme dan semangat belajar yang tinggi telah bergabung sebagai anggota perpustakaan. Keputusannya untuk menjadi member perpustakaan menunjukkan dedikasinya terhadap pengetahuan dan literasi. Dengan keanggotaannya, Nenden Nuraeni memiliki akses ke berbagai sumber informasi yang bermanfaat, mulai dari buku cetak hingga sumber digital.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
            'Nenden Nuraeni',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Member Perpustakaan",
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 30,
              ),
              SizedBox(
                width: 60,
              ),
              Icon(
                Icons.comment,
                size: 30,
              ),
              SizedBox(
                width: 60,
              ),
              Icon(
                Icons.book,
                size: 30,
              ),
            ],
          )
        ],
      );

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        )
      ],
    );
  }

  Widget buildCoverImage() {
    return Column(
      children: [
        Image.network(
          "https://images.wallpaperscraft.com/image/single/leaves_branch_dark_green_130572_1280x960.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage("https://i.ibb.co/B6bR8Gw/1.jpg"),
      );
}
