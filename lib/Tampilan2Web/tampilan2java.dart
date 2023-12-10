import 'package:flutter/material.dart';
import 'package:flutterperpus/Tampilan2Pemrograman/model.dart';
import 'package:flutterperpus/Tampilan2Web/repositoryweb.dart';
import 'package:flutterperpus/Tampilan3/tampilan3pemrograman.dart';

class Tampilan2Web extends StatefulWidget {
  const Tampilan2Web({Key? key});

  @override
  State<Tampilan2Web> createState() => _Tampilan2WebState();
}

class _Tampilan2WebState extends State<Tampilan2Web> {
  late final BookBlocWeb _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BookBlocWeb();
    _bloc.fetchBooks();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 196, 231, 198),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Katalog Buku",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 630,
            child: StreamBuilder<List<Book>>(
              stream: _bloc.bookStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Loading Book'));
                }

                return ListView.builder(
                  itemBuilder: (context, index) =>
                      BukuCard(snapshot.data![index]),
                  itemCount: snapshot.data!.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BukuCard extends StatelessWidget {
  final Book book;

  BukuCard(this.book);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailBuku(
              image: book.image,
              title: book.title,
              subtitle: book.subtitle,
              isbn13: book.isbn13,
              url: book.url,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 121, 172, 120),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  book.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    book.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    book.subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
