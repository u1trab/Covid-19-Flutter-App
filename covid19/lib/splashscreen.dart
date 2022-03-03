import 'package:flutter/material.dart';
import 'homepage.dart';
import 'globals.dart' as globals;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            fit: BoxFit.cover,
            image: AssetImage(
                globals.imglist[2]), // getting the image from the list
          ),
          // Covid Text
          const Text('COVID-19\n',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                  height: 2)),
          // button for Home Screen
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.greenAccent,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              fixedSize: const Size(350, 50),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Row(
              // Used to align the text and icon to corners
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Get Started',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                // contaiher for the background color of button's icon
                Container(
                  color: globals.primaryColor,
                  margin: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white, // background color of the icon
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
