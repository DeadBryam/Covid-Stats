import 'dart:convert';

import 'package:covid/components/chart.dart';
import 'package:covid/components/statsCard.dart';
import 'package:covid/models/cases.dart';
import 'package:covid/utils/colors.dart';
import 'package:covid/utils/httpRequest.dart';
import 'package:covid/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:theme_mode_handler/theme_picker_dialog.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Cases _data;
  HttpRequest _httpRequest = HttpRequest();

  @override
  void initState() {
    _httpRequest.getStats("All").then((data) {
      setState(() {
        _data = Cases.fromJson(json.decode(data.body)['response'][0]);
      });
    });
    super.initState();
  }

  void _selectThemeMode(BuildContext context) async {
    final newThemeMode = await showThemePickerDialog(context: context);
    print(newThemeMode);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "COVID STATS 2020",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.title),
              onPressed: () {
                _selectThemeMode(context);
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _size.height * 0.4,
              child: Center(
                child: _data != null
                    ? DonutChart(
                        active: _data.active,
                        deaths: _data.deaths,
                        recovered: _data.recovered)
                    : null,
              ),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StatsCard.text("Casos globales", 30, true),
                  Row(
                    children: <Widget>[
                      StatsCard.indicator(
                        "Totales",
                        _data?.total,
                        AppColors.red,
                        20,
                      ),
                      StatsCard.indicator(
                        "Activos",
                        _data?.active,
                        AppColors.green,
                        20,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      StatsCard.indicator(
                        "Recuperados",
                        _data?.recovered,
                        AppColors.blue,
                        20,
                      ),
                      StatsCard.indicator(
                        "Muertos",
                        _data?.deaths,
                        AppColors.yellow,
                        20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toRoute(context: context, path: "/search");
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
