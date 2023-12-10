import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 97, 130, 100),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 208, 231, 210),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'About Perpustakaan',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 208, 231, 210),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                ListTile(
                  leading: Icon(
                    Icons.business,
                    color: Color.fromARGB(255, 97, 130, 100),
                    size: 36.0,
                  ),
                  title: Text(
                    'Pepustakaan Sinau Kaca',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 130, 100),
                    ),
                  ),
                  subtitle: Text(
                    'Berdiri Tahun 2020 di Malang',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Color.fromARGB(255, 97, 130, 100),
                    size: 36.0,
                  ),
                  title: Text(
                    'Lokasi',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 130, 100),
                    ),
                  ),
                  subtitle: Text(
                    'Berlokasi di Jalan Panglima Sudirman No. 5 Kota Malang',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ListTile(
                  leading: Icon(
                    Icons.people,
                    color: Color.fromARGB(255, 97, 130, 100),
                    size: 36.0,
                  ),
                  title: Text(
                    'Pemimpin',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 130, 100),
                    ),
                  ),
                  subtitle: Text(
                    'Di Pimpim Oleh Kepala Perpustakaan Bu Nenden Nuraeni, Beserta Staff Karyawan Perpustakaan',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ListTile(
                  leading: Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 97, 130, 100),
                    size: 36.0,
                  ),
                  title: Text(
                    'Visi',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 130, 100),
                    ),
                  ),
                  subtitle: Text(
                    'Menjadi pusat pengetahuan terkemuka yang mendukung perkembangan ilmu pengetahuan, pembelajaran sepanjang hayat, dan inovasi dalam masyarakat.',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ListTile(
                  leading: Icon(
                    Icons.book,
                    color: Color.fromARGB(255, 97, 130, 100),
                    size: 36.0,
                  ),
                  title: Text(
                    'Misi',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 130, 100),
                    ),
                  ),
                  subtitle: Text(
                    'Menjadi pusat pengetahuan terkemuka yang mendukung perkembangan ilmu pengetahuan, pembelajaran sepanjang hayat, dan inovasi dalam masyarakat.',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
