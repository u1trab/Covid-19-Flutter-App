import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<Data> fetchData() async {
  final response =
      await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Data.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load json data');
  }
}

class Data {
  final String updated;
  final String cases;
  final String todayCases;
  final String deaths;
  final String todayDeaths;
  final String recovered;
  final String todayRecovered;
  final String active;
  final String critical;
  final String casesPerOneMillion;
  final String deathsPerOneMillion;
  final String tests;
  final String testsPerOneMillion;
  final String population;
  final String oneCasePerPeople;
  final String oneDeathPerPeople;
  final String oneTestPerPeople;
  final String activePerOneMillion;
  final String recoveredPerOneMillion;
  final String criticalPerOneMillion;
  final String affectedCountries;

  Data({
    required this.updated,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
    required this.affectedCountries,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    final f = NumberFormat.decimalPattern('el');
    return Data(
      updated: json['updated'].toString(),
      cases: f.format(json['cases']),
      todayCases: f.format(json['todayCases']),
      deaths: f.format(json['deaths']),
      todayDeaths: f.format(json['todayDeaths']),
      recovered: f.format(json['recovered']),
      todayRecovered: json['todayRecovered'].toString(),
      active: f.format(json['active']),
      critical: f.format(json['critical']),
      casesPerOneMillion: json['casesPerOneMillion'].toString(),
      deathsPerOneMillion: json['deathsPerOneMillion'].toString(),
      tests: json['tests'].toString(),
      testsPerOneMillion: json['testsPerOneMillion'].toString(),
      population: f.format(json['population']),
      oneCasePerPeople: json['oneCasePerPeople'].toString(),
      oneDeathPerPeople: json['oneDeathPerPeople'].toString(),
      oneTestPerPeople: json['oneTestPerPeople'].toString(),
      activePerOneMillion: json['activePerOneMillion'].toString(),
      recoveredPerOneMillion: json['recoveredPerOneMillion'].toString(),
      criticalPerOneMillion: json['criticalPerOneMillion'].toString(),
      affectedCountries: json['affectedCountries'].toString(),
    );
  }
}
