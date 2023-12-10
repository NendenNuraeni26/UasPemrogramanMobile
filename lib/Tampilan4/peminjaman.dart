import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PeminjamanBuku(),
  ));
}

class PeminjamanBuku extends StatefulWidget {
  @override
  _PeminjamanBukuState createState() => _PeminjamanBukuState();
}

class _PeminjamanBukuState extends State<PeminjamanBuku> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _judulBukuController = TextEditingController();
  String? _lamaPeminjaman;

  @override
  void dispose() {
    _namaController.dispose();
    _judulBukuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 130, 100),
      body: Stack(
        children: [
          Positioned(
            top: 23,
            left: 20,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Center(
            child: Container(
              height: 550,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 208, 231, 210),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Peminjaman Buku',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama harus diisi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _judulBukuController,
                        decoration: InputDecoration(
                          labelText: 'Judul Buku',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul buku harus diisi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _lamaPeminjaman,
                        onChanged: (String? value) {
                          setState(() {
                            _lamaPeminjaman = value;
                          });
                        },
                        items: <String?>['3 hari', '5 hari', '7 hari']
                            .map((String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value ?? ''),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Lama Peminjaman',
                        ),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(
                              255, 97, 130, 100), // Warna latar belakang
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Tambahkan kode untuk mengirim data peminjaman buku
                          }
                        },
                        child: Text('Kirim'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
