import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(top: 24, bottom: 28),
        child: TextFormField(
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: 'Ürün Ara...',
            hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ));
  }
}
