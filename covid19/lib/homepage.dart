import 'package:flutter/material.dart';
import 'api/get_global.dart';
import 'globals.dart' as globals;
import 'symptoms.dart' as symptoms;
import 'preventationcard.dart';
import 'stats.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<Data?> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Covid-19')),
      body: Column(
        children: <Widget>[
          _globalCases(context),
        ],
      ),
    );
  }

  Widget _globalCases(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: '',
              style: globals.hText,
              children: const <TextSpan>[
                TextSpan(
                  text: 'Symptoms of ',
                ),
                TextSpan(
                  text: 'Covid-19',
                  style: TextStyle(color: globals.primaryColor),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var item in globals.symtpoms)
                        symptoms.symptomsCard(
                            item[0], item[1], int.parse(item[2])),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Most commom | ',
                          style: TextStyle(color: Color(0xFFf9c78d))),
                      TextSpan(
                          text: 'Less commom | ',
                          style: TextStyle(color: Color(0xFFb0d9f0))),
                      TextSpan(
                          text: 'Serious',
                          style: TextStyle(color: Color(0xFFf5a2a7))),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 10, 30),
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StatsPage()));
                },
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: ListTile(
                    visualDensity:
                        const VisualDensity(horizontal: 3), // to expand
                    leading: Image.asset(
                      'assets/icons/map.png',
                    ),
                    title: const Text(
                      'Total cases',
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: FutureBuilder<Data?>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.cases);
                        } else if (snapshot.hasError) {
                          return const Text('No Data');
                        }
                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 35,
                    ),
                    //isThreeLine: true,
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Preventation',
                style: globals.hText,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var item in globals.preventation)
                      preventationCard(item[0], item[1], item[2]),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
