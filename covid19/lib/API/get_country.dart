import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<CountryData> fetchCountryData() async {
  final response = await http
      .get(Uri.parse('https://disease.sh/v3/covid-19/countries/greece'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CountryData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load json CountryData');
  }
}

class CountryData {
  final String updated;
  final String cases;
  final String todayCases;
  final String deaths;
  final String todayDeaths;
  final String recovered;
  final String todayRecovered;
  final String active;
  final String critical;
  final String population;

  CountryData({
    required this.updated,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.population,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) {
    final f = NumberFormat.decimalPattern('el');
    return CountryData(
      updated: json['updated'].toString(),
      cases: f.format(json['cases']),
      todayCases: f.format(json['todayCases']),
      deaths: f.format(json['deaths']),
      todayDeaths: f.format(json['todayDeaths']),
      recovered: f.format(json['recovered']),
      todayRecovered: json['todayRecovered'].toString(),
      active: f.format(json['active']),
      critical: f.format(json['critical']),
      population: f.format(json['population']),
    );
  }
}
