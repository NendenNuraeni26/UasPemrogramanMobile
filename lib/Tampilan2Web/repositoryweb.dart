import 'dart:convert';
import 'package:flutterperpus/Tampilan2Pemrograman/model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class BookBlocWeb {
  final _bookSubject = BehaviorSubject<List<Book>>.seeded([]);
  Stream<List<Book>> get bookStream => _bookSubject.stream;

  Future<List<Book>> fetchBooks() async {
    var url = 'https://api.itbook.store/1.0/search/web';
    var response = await http.get(Uri.parse(url));
    var bookList = <Book>[];

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      for (var bookData in data['books']) {
        bookList.add(Book.fromJSON(bookData));
      }
    }

    _bookSubject.add(bookList);

    return bookList;
  }

  void dispose() {
    _bookSubject.close();
  }

  Future<List<Book>> fetchSearchBooks(String querySearch) async {
    String src = querySearch.toLowerCase();
    var url = Uri.parse('https://api.itbook.store/1.0/search/${src} a');
    print(url);

    var response = await http.get(url);
    var bookList = <Book>[];

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      for (var bookData in data['books']) {
        var book = Book.fromJSON(bookData);

        // Check if either title or subtitle contains the querySearch
        if (book.title.toLowerCase().contains(querySearch.toLowerCase()) ||
            book.subtitle.toLowerCase().contains(querySearch.toLowerCase())) {
          bookList.add(book);
        }
      }
    }

    _bookSubject.add(bookList);

    return bookList;
  }
}
