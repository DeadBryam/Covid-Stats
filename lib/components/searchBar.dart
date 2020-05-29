import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function() onTap;
  final TextEditingController textController;

  SearchBar({@required this.onTap, @required this.textController});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.maxFinite,
        height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: this.textController,
                  decoration: InputDecoration.collapsed(hintText: "SEARCH"),
                  onSubmitted: (val){
                    this.onTap();
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: this.onTap,
            ),
          ],
        ),
      ),
      elevation: 2,
    );
  }
}
