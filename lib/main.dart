import 'package:covid/views/countryStats.dart';
import 'package:covid/views/home.dart';
import 'package:covid/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

void main() async{
  await DotEnv().load('.env');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeModeHandler(builder: (ThemeMode themeMode) {
      return MaterialApp(
        initialRoute: "/",
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xff1A2A47),
          primaryColor: Colors.black,
          cardColor: Color(0xff26395E),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff516A99),
          ),
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
          ),
        ),
        theme: ThemeData(
          primaryColor: Colors.yellow,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff8637F3),
          ),
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
          ),
        ),
        themeMode: themeMode,
        routes: {
          "/": (context) => Home(),
          "/search": (context) => Search(),
          "/country": (context) => CountryStats(),
        },
      );
    });
  }
}
