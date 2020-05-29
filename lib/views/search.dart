import 'dart:convert';

import 'package:covid/components/searchBar.dart';
import 'package:covid/components/searchItem.dart';
import 'package:covid/models/cases.dart';
import 'package:covid/utils/httpRequest.dart';
import 'package:covid/utils/routing.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List _countries = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    HttpRequest().getCountries().then((res) {
      setState(() {
        _countries = json.decode(res.body)['response'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SearchBar(
          textController: this._controller,
          onTap: () {
            HttpRequest().getCountries(this._controller.text).then((res) {
              setState(() {
                _countries = json.decode(res.body)['response'];
              });
            });
          },
        ),
      ),

// [{country: Anguilla, cases: {new: null, active: 2, critical: 0, recovered: 1, total: 3},
// deaths: {new: null, total: 0}, tests: {total: null}, day: 2020-04-16, time: 2020-04-16T17:15:05+00:00}]

      body: ListView.builder(
        itemCount: _countries.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SearchItem(
                title: (_countries[index] as String).replaceAll("-", " "),
                onTap: () {
                  HttpRequest().getStats(_countries[index]).then((data) {
                    toRoute(
                      context: context,
                      path: "/country",
                      arguments: Cases.fromJson(json.decode(data.body)['response'][0]),
                    );
                  });
                }),
          );
        },
      ),
    );
  }
}
