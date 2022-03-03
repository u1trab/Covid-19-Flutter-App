import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// κύριο χρώμα εφαρμογής
const primaryColor = Color(0xFF8be3d7);

// style κειμένου παραγράφων (aka h1 like)
var hText = const TextStyle(
  color: Colors.black,
  fontFamily: 'QuickSand',
  fontWeight: FontWeight.w600,
  fontSize: 30,
  //height: 2
);

// λίστα εικόνων αρχικής σελίδας
var imglist = [
  'assets/icons/background.png',
  'assets/icons/top.png',
  'assets/icons/Doctor.gif',
];

// λίστα εικόνων συμπτωμάτων
var symtpoms = [
  ['assets/icons/symptoms/fever.png', 'Fever', '0xFFf9c78d'],
  ['assets/icons/symptoms/cough.png', 'Cough', '0xFFf9c78d'],
  ['assets/icons/symptoms/weakness.png', 'Weakness', '0xFFf9c78d'],
  ['assets/icons/symptoms/taste.png', 'Loss of Taste or Smell', '0xFFf9c78d'],
  ['assets/icons/symptoms/throat.png', 'Sore throat', '0xFFb0d9f0'],
  ['assets/icons/symptoms/headache.png', 'Headache', '0xFFb0d9f0'],
  ['assets/icons/symptoms/aches.png', 'Aches & Pains', '0xFFb0d9f0'],
  ['assets/icons/symptoms/diarrhoea.png', 'Diarrhea', '0xFFb0d9f0'],
  ['assets/icons/symptoms/skin.png', 'Rash skin', '0xFFb0d9f0'],
  ['assets/icons/symptoms/eyes.png', 'Red or irritated eyes', '0xFFb0d9f0'],
  ['assets/icons/symptoms/breath.png', 'Difficulity breathing', '0xFFf5a2a7'],
  ['assets/icons/symptoms/speech.png', 'Loss of speech', '0xFFf5a2a7'],
  ['assets/icons/symptoms/chest.png', 'Chest Pain', '0xFFf5a2a7'],
];

// λίστα εικόνων συμπτωμάτων
var preventation = [
  ['assets/icons/preventation/mask.png', 'WEAR', 'mask'],
  ['assets/icons/preventation/hands.png', 'WASH', 'hands often'],
  ['assets/icons/preventation/disinfectant.png', 'CLEAN', 'areas often'],
  ['assets/icons/preventation/sanitiser.png', 'USE', 'sanitizers'],
  ['assets/icons/preventation/touch.png', 'DONT', 'touch your eyes'],
  ['assets/icons/preventation/social.png', 'KEEP', 'distance'],
  ['assets/icons/preventation/home.png', 'STAY', 'home'],
];

// Decoration για τις κάρτες
BoxDecoration cardDecoration(int cardbgColor) {
  return BoxDecoration(
    color: Color(cardbgColor),
    border: Border.all(color: const Color(0xffeeeeee), width: 2.0),
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    boxShadow: const [
      BoxShadow(
        color: Colors.white10,
        blurRadius: 4,
        spreadRadius: 2,
        offset: Offset(0, 2),
      ),
    ],
  );
}

launchURLBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
