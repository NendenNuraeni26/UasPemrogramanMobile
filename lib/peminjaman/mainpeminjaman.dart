import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterperpus/firebase_options.dart';
import 'package:flutterperpus/main1.dart';
import 'package:flutterperpus/peminjaman/server.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Pinjam());
}

class Pinjam extends StatelessWidget {
  const Pinjam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peminjaman Buku',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyHomeState();
}

class _MyHomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyAppTampilan1()),
            );
          },
        ),
        title: Text('Peminjaman Buku', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 97, 130, 100),
      ),
      body: _buildBody(),
      backgroundColor:
          Color.fromARGB(255, 208, 231, 210), // Warna latar belakang body
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Database.create(context);
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 97, 130, 100),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: Database.getData(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.data != null) {
            List<QueryDocumentSnapshot<Object?>> listData = snapshot.data!.docs;
            return _buildListView(listData);
          }
        }
        return Center(
          child: Text('Tidak Ada Data'),
        );
      },
    );
  }

  Widget _buildListView(List<QueryDocumentSnapshot<Object?>> listData) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        final DocumentSnapshot documentSnapshot = listData[index];
        return Card(
          color: const Color.fromARGB(255, 176, 217, 177),
          elevation: 3,
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text(documentSnapshot['nama']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Judul: ${documentSnapshot['price']}'),
                Text('Lama Pinjam: ${documentSnapshot['lamapinjam']}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Database.update(documentSnapshot, context);
                  },
                  icon: Icon(Icons.edit, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    Database.delete(documentSnapshot, context);
                  },
                  icon: Icon(Icons.delete, color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
