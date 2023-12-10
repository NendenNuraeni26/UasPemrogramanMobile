import 'package:flutter/material.dart';
import 'package:flutterperpus/Tampilan1/search.dart';
import 'package:flutterperpus/Tampilan2Java/tampilan1java.dart';
import 'package:flutterperpus/Tampilan2Java/tampilan2java.dart';
import 'package:flutterperpus/Tampilan2Pemrograman/judul.dart';

void main() {
  runApp(MainJava());
}

class MainJava extends StatefulWidget {
  const MainJava({Key? key});

  @override
  State<MainJava> createState() => _MainJavaState();
}

class _MainJavaState extends State<MainJava> {
  String searchValue = '';
  TextEditingController srcCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 97, 130, 100),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 208, 231, 210),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: ListView(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 97, 130, 100),
                ),
                child: Column(
                  children: [Judul(), searchbuku()],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 310,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: [
                    searchValue.isEmpty
                        ? Tampilan1Java()
                        : Search(nama: srcCtr.text.toLowerCase()),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Tampilan2java()
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
                print('Performing search for: $searchValue');
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
