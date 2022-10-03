import 'package:flutter/material.dart';
import 'package:kuis_124200002/books_data.dart';
import 'package:kuis_124200002/detail_buku.dart';
import 'books_data.dart';
import 'detail_buku.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DAFTAR BUKU"),
      ),
      body: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final BooksData place = booksDataList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(albumIdx: index);
              }));
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.lightGreen.shade500,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Image.network(place.imageLinks, width: 700, height: 300,)
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: booksDataList.length,
      ),
    );
  }
}