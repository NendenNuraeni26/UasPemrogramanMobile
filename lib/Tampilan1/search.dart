import 'package:flutter/material.dart';

import 'package:flutterperpus/Tampilan2Pemrograman/model.dart';
import 'package:flutterperpus/Tampilan2Pemrograman/repository.dart';
import 'package:flutterperpus/Tampilan3/tampilan3pemrograman.dart';

class Search extends StatefulWidget {
  final String nama;
  const Search({super.key, required this.nama});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final BookBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BookBloc();
    _bloc.fetchSearchBooks(widget.nama.toLowerCase());
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            Text(
              "Daftar Search Baru",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
          width: 500,
          height: 170,
          child: StreamBuilder<List<Book>>(
            stream: _bloc.bookStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No books available'));
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if ([1, 3, 5].contains(index) &&
                      index < snapshot.data!.length) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailBuku(
                              image: snapshot.data![index].image,
                              title: snapshot.data![index].title,
                              subtitle: snapshot.data![index].subtitle,
                              isbn13: snapshot.data![index].isbn13,
                              url: snapshot.data![index].url,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Gambar(snapshot.data![index]),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                itemCount: snapshot.data!.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class Gambar extends StatelessWidget {
  final Book book;

  Gambar(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(4, 8, 4, 0),
      color: Colors.white60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            book.image,
            height: 100,
            width: 150,
          ),
          SizedBox(height: 10),
          Text(
            book.title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
