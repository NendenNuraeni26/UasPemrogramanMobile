import 'package:flutter/material.dart';
import 'package:flutterperpus/Tampilan2Pemrograman/model.dart';
import 'package:flutterperpus/Tampilan2Web/repositoryweb.dart';
import 'package:flutterperpus/Tampilan3/tampilan3pemrograman.dart';

class TampilanWeb extends StatefulWidget {
  const TampilanWeb({Key? key});

  @override
  State<TampilanWeb> createState() => _TampilanWebState();
}

class _TampilanWebState extends State<TampilanWeb> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pemrograman Populer",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
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
                    // Display only indices 1, 5, and 7
                    if ([1, 2, 7].contains(index) &&
                        index < snapshot.data!.length) {
                      // Display only indices 1, 2, and 3
                      // if (index >= 3 &&
                      //     index <= 5 &&
                      //     index < snapshot.data!.length) {
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
                        child: KatalogItem(snapshot.data![index]),
                      );
                    } else {
                      // Return an empty container for indices other than 1, 2, and 3
                      return Container();
                    }
                  },
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

class KatalogItem extends StatelessWidget {
  final Book book;

  KatalogItem(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 160,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 97, 130, 100),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              book.image,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 0, 0, 1),
            child: Text(
              book.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
