import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String title;
  final void Function() onTap;

  SearchItem({@required this.title,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 70,
        child: FlatButton(
          onPressed: this.onTap,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
