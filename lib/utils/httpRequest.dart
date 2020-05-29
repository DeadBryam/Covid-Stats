import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  final _headers = {
    "x-rapidapi-host": "${DotEnv().env['BASE_URL']}",
    "x-rapidapi-key": "${DotEnv().env['API_KEY']}",
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response> getCountries([String country]) {
    country = (country == null || country.isEmpty) ? "" : "?search=$country";
    return http.get("https://${DotEnv().env['BASE_URL']}/countries$country",
        headers: _headers);
  }

  Future<http.Response> getStats([String country]) {
    country = (country == null) ? "All" : "?country=$country";
    return http.get("https://${DotEnv().env['BASE_URL']}/statistics$country",
        headers: _headers);
  }
}
