import 'package:flutter/material.dart';
import 'stats_widgets.dart';
import 'api/get_global.dart';
import 'api/get_country.dart';
import 'globals.dart';

class StatsPage extends StatefulWidget {
  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  String dropdownValue = '🌎 Global';
  late Future<Data> futureData;
  late Future<CountryData> futureCountryData;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
    futureCountryData = fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Statistics')),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  value: dropdownValue,
                  elevation: 20,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!.toString();
                      if (_pageController.hasClients) {
                        _pageController.animateToPage(
                          dropdownValue == '🌎 Global' ? 0 : 2,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    });
                  },
                  items: <String>['🌎 Global', '🇬🇷 Greece']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    dropdownValue == '🌎 Global'
                        ? launchURLBrowser(
                            'https://www.coronatracker.com/analytics')
                        : launchURLBrowser(
                            'https://www.coronatracker.com/country/greece/');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                _globalStats(),
                _countryStats(),
              ],
            ),
          )
        ]));
  }

  _globalStats() {
    return FutureBuilder<Data>(
      future: futureData,
      builder: (context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            getStats(context, snapshot),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.grey),
                    children: const <TextSpan>[
                      TextSpan(
                        text: '\nPlease check your internet connection',
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ))
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }
        return Center(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }

  _countryStats() {
    return FutureBuilder<CountryData>(
      future: futureCountryData,
      builder: (context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            getStats(context, snapshot),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.grey),
                    children: const <TextSpan>[
                      TextSpan(
                        text: '\nPlease check your internet connection',
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ))
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
