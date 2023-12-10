import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterperpus/Tampilan1/ikon.dart';
import 'package:flutterperpus/Tampilan1/koleksi.dart';
import 'package:flutterperpus/Tampilan1/navbar.dart';
import 'package:flutterperpus/Tampilan1/pencarian.dart';
import 'package:flutterperpus/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
              Pencarian(),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 208, 231, 210)),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      KategoriApp(),
                      SizedBox(height: 10),
                      Koleksi(),
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
}
