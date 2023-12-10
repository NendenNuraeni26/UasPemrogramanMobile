import 'package:flutter/material.dart';

class DetailBuku extends StatelessWidget {
  final String image, title, subtitle, isbn13, url;

  DetailBuku({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 130, 100),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
        height: 630,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          color: Color.fromARGB(255, 208, 231, 210),
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Text(
                '$title',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Image.network(image, height: 300, width: 250),
              Text('$url',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15)),
              SizedBox(height: 20),
              Text('No ISBN : $isbn13',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              SizedBox(height: 15),
              Text('Deskription : $subtitle',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 17)),
            ],
          ),
        ),
      ),
    );
  }
}
