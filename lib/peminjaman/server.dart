import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _products = FirebaseFirestore.instance.collection('data');
final TextEditingController _namaControler = TextEditingController();
final TextEditingController _judulControler = TextEditingController();
final TextEditingController _lamapinjamControler = TextEditingController();

class Database {
  static Stream<QuerySnapshot> getData() {
    return _products.snapshots();
  }

  static Future<void> update(
      DocumentSnapshot? snapshot, BuildContext context) async {
    if (snapshot != null) {
      _namaControler.text = snapshot['nama'];
      _judulControler.text = snapshot['price'];
      _lamapinjamControler.text = snapshot['lamapinjam'];
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _namaControler,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _judulControler,
              decoration: const InputDecoration(labelText: 'Judul Buku'),
            ),
            TextField(
              controller: _lamapinjamControler,
              decoration: const InputDecoration(labelText: 'Lama Peminjaman'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final String nama = _namaControler.text;
                final String judul = _judulControler.text;
                final String lamapinjam = _lamapinjamControler.text;
                if (judul != null) {
                  await _products.doc(snapshot?.id).update(
                      {'nama': nama, 'price': judul, 'lamapinjam': lamapinjam});
                }
              },
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> create(BuildContext context) async {
    _namaControler.clear();
    _judulControler.clear();
    _lamapinjamControler.clear();

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _namaControler,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _judulControler,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: _lamapinjamControler,
              decoration: const InputDecoration(labelText: 'Lama Peminjaman'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final String nama = _namaControler.text;
                final String judul = _judulControler.text;
                final String lamapinjam = _lamapinjamControler.text;
                if (judul != null) {
                  await _products.add(
                      {'nama': nama, 'price': judul, 'lamapinjam': lamapinjam});
                }
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> delete(
      DocumentSnapshot snapshot, BuildContext context) async {
    await _products.doc(snapshot.id).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Data berhasil dihapus"),
      duration: Duration(seconds: 1),
    ));
  }
}
