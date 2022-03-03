import 'package:flutter/material.dart';
import 'globals.dart' as globals;

Widget symptomsCard(String symtpomImg, String symptomText, int colorr) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 8, 8, 8),
    decoration: globals.cardDecoration(colorr),
    // container size
    height: 125,
    width: 125,
    child: Card(
      child: Column(
        // centering vertical
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              // symptom image
              child: Image(
            image: AssetImage(symtpomImg),
            height: 60,
          )),
          // symptom text
          Text(
            symptomText,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
