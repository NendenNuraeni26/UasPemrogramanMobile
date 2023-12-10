class Book {
  var title, subtitle, isbn13, image, url;

  Book(this.title, this.subtitle, this.isbn13, this.image, this.url);

  Book.fromJSON(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    isbn13 = json['isbn13'];
    image = json['image'];
    url = json['url'];
  }
}
