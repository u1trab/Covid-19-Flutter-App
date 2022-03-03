import 'globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

_statBox(snapshot, bgColor, txt, txtCases) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              txt,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: CupertinoColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              txtCases,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: CupertinoColors.black),
            ),
          ),
        ],
      ),
    ),
  );
}

_cardRow(context, snapshot, text, data, bgColor, txtColor) {
  return Container(
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                data,
                style: TextStyle(fontWeight: FontWeight.w700, color: txtColor),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

getStats(context, snapshot) {
  return Container(
    margin: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _cardRow(context, snapshot, 'Today Cases',
            snapshot.data!.todayCases.toString(), primaryColor, Colors.blue),
        _cardRow(context, snapshot, 'Today Deaths ',
            snapshot.data!.todayDeaths.toString(), primaryColor, Colors.red),
        Text(
          'Total stats',
          style: Theme.of(context).textTheme.headline5,
        ),
        _cardRow(
            context,
            snapshot,
            'Population',
            snapshot.data!.population.toString(),
            Colors.grey[300],
            Colors.black),
        Row(
          children: <Widget>[
            _statBox(snapshot, const Color.fromARGB(255, 255, 178, 89),
                'Affected', snapshot.data!.cases.toString()),
            Container(
              width: 20,
            ),
            _statBox(snapshot, const Color.fromARGB(255, 75, 215, 125),
                'Recovered', snapshot.data!.recovered.toString()),
          ],
        ),
        Container(height: 20),
        Row(
          children: <Widget>[
            _statBox(snapshot, const Color.fromARGB(255, 255, 89, 89), 'Deaths',
                snapshot.data!.deaths.toString()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: _statBox(snapshot, const Color.fromARGB(255, 75, 180, 255),
                  'Active', snapshot.data!.active.toString()),
            ),
            _statBox(snapshot, const Color.fromARGB(255, 55, 185, 178),
                'Serious', snapshot.data!.critical.toString()),
          ],
        ),
      ],
    ),
  );
}
