// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'globals.dart' as globals;

Widget preventationCard(String preventationIcon, String preventationText1,
    String preventationText2) {
  // using wrap so the size of the card equivilants to content
  return Wrap(
    children: [
      Card(
        child: Padding(
          // padding 10px all around
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Row(
              // centering items v & h
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // image of the card
                Image(
                  image: AssetImage(preventationIcon),
                  height: 80,
                ),
                RichText(
                  // first text of the card (the bigger * colored one)
                  text: TextSpan(
                    text: preventationText1,
                    style: const TextStyle(
                        color: globals.primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                    children: <TextSpan>[
                      // second text of the card
                      TextSpan(
                          text: '\n' + preventationText2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
