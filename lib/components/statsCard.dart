import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';

class StatsCard {
  static final _display = createDisplay(length: 12);

  static Text text(String text, double size, [bool bolded]) => Text(
        text,
        style: TextStyle(
            fontSize: size,
            fontWeight:
                (bolded ?? false) ? FontWeight.bold : FontWeight.normal),
      );

  static Widget indicator(String title, dynamic quantity, Color color,
      [double padding]) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding ?? 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.bubble_chart,
                    color: color,
                  ),
                  text(" $title", 20, true),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: padding == null ? 0 : 10),
              ),
              quantity == null
                  ? Icon(
                      Icons.help_outline,
                      color: Colors.white,
                      size: 40,
                    )
                  : text(
                      (quantity is int) ? _display(quantity) : quantity,
                      40,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
