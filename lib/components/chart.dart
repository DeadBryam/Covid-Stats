import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as Charts;

class DonutChart extends StatelessWidget {
  final int active;
  final int recovered;
  final int deaths;

  DonutChart(
      {@required this.active, @required this.deaths, @required this.recovered});

  List<Charts.Series<PieChartSerie, int>> _dataPie() {
    final _serie = [
      PieChartSerie(
          0,
          this.active,
          Charts.Color.fromHex(
            code: '#52D269',
          ),
          "Activos"),
      PieChartSerie(
          2, this.deaths, Charts.Color.fromHex(code: '#F0C552'), "Muertes"),
      PieChartSerie(1, this.recovered, Charts.Color.fromHex(code: '#30ACEB'),
          "Recuperados"),
    ];

    return [
      Charts.Series<PieChartSerie, int>(
          id: 'Covid',
          domainFn: (PieChartSerie chartSerie, _) => chartSerie.id,
          measureFn: (PieChartSerie chartSerie, _) => chartSerie.amount,
          colorFn: (PieChartSerie chartSerie, _) => chartSerie.color,
          data: _serie,
          labelAccessorFn: (PieChartSerie chartSerie, _) => chartSerie.title,
          displayName: "Covid stats")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Charts.PieChart(
      _dataPie(),
      defaultRenderer: Charts.ArcRendererConfig(
        arcWidth: 60,
        arcRendererDecorators: [Charts.ArcLabelDecorator()],
      ),
      animate: true,
    );
  }
}

class PieChartSerie {
  final int id;
  final int amount;
  final String title;
  final Charts.Color color;

  PieChartSerie(this.id, this.amount, this.color, this.title);
}
