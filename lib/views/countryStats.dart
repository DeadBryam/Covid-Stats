import 'package:covid/components/chart.dart';
import 'package:covid/components/statsCard.dart';
import 'package:covid/models/cases.dart';
import 'package:covid/utils/colors.dart';
import 'package:flutter/material.dart';

class CountryStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final Cases _data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          _data.country,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: _size.height * 0.3,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StatsCard.text("Totales", 30, true),
                Row(
                  children: <Widget>[
                    StatsCard.indicator(
                      "Recuperados",
                      _data.recovered,
                      AppColors.blue,
                    ),
                    StatsCard.indicator(
                      "Muertos",
                      _data.deaths,
                      AppColors.yellow,
                    ),
                    StatsCard.indicator(
                      "Activos",
                      _data.active,
                      AppColors.green,
                    ),
                  ],
                ),
                StatsCard.text("Nuevos", 30, true),
                Row(
                  children: <Widget>[
                    StatsCard.indicator(
                      "Criticos",
                      _data.critical,
                      AppColors.red,
                    ),
                    StatsCard.indicator(
                      "Muertos",
                      _data.newDeaths,
                      AppColors.yellow,
                    ),
                    StatsCard.indicator(
                      "Confirmados",
                      _data.newActive,
                      AppColors.green,
                    ),
                  ],
                ),
                StatsCard.text("Estado", 30, true),
                Row(
                  children: <Widget>[
                    StatsCard.indicator(
                        "Casos", _data.total, AppColors.green),
                    StatsCard.indicator(
                        "Pruebas", _data.test, AppColors.lightblue),
                  ],
                ),
                StatsCard.text(_data.day, 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
