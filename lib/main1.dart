import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterperpus/Tampilan1/ikon.dart';
import 'package:flutterperpus/Tampilan1/koleksi.dart';
import 'package:flutterperpus/Tampilan1/navbar.dart';
import 'package:flutterperpus/Tampilan1/search.dart';
import 'package:flutterperpus/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyAppTampilan1());
}

class MyAppTampilan1 extends StatefulWidget {
  @override
  _MyAppTampilan1State createState() => _MyAppTampilan1State();
}

class _MyAppTampilan1State extends State<MyAppTampilan1> {
  String searchValue = '';
  TextEditingController srcCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 97, 130, 100),
        body: Container(
          padding: EdgeInsets.fromLTRB(5, 50, 0, 0),
          child: ListView(
            children: [
              Navbar(),
              searchbuku(),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 208, 231, 210),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      KategoriApp(),
                      SizedBox(height: 10),
                      searchValue.isEmpty
                          ? Koleksi()
                          : Search(nama: srcCtr.text.toLowerCase()),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchbuku() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
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
              controller: srcCtr,
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                  print(srcCtr.text);
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari Buku',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 97, 130, 100),
            ),
            margin: EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(Icons.mic, color: Colors.white),
              onPressed: () async {
                // Perform the search using _searchValue
                print('Performing search for: $searchValue');
                // You can call your search function here
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget NoResultsWidget() {
    return Center(
      child: Text(
        'No results found.',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
