import 'package:flutter/cupertino.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_background/animated_background.dart';
import 'package:hr_who_is_going_to_quit/pageDetails.dart';
import 'package:hr_who_is_going_to_quit/wave_widget.dart';

import 'FadeAnimation.dart';
import 'package:flutter/material.dart';

ScreenScaler scaler = new ScreenScaler();

class notQuitPage extends StatefulWidget {

  @override
  _notQuitPageState createState() => _notQuitPageState();
}

class _notQuitPageState extends State<notQuitPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[ WaveWidget(Size(scaler.getWidth(100),scaler.getHeight(100)),scaler.getHeight(15)),Column(
              children:[  SizedBox(height: scaler.getHeight(3)),Image(
                  alignment: Alignment.topCenter,
                  height: scaler.getHeight(12),
                  width: scaler.getWidth(100) ,
                  image: NetworkImage(
                      "https://www.pageuppeople.com/wp-content/uploads/2019/01/Top-60-Employee-Engagement-image43.png")),
                SizedBox(height: scaler.getHeight(1)),Text(
                  "Your worker",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alef(
                      fontWeight: FontWeight.normal,
                      fontSize: scaler.getTextSize(11),
                      color: Colors.red[900]),
                ),Text(
                  "will stay!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alef(
                      fontWeight: FontWeight.bold,
                      fontSize: scaler.getTextSize(11),
                      color: Colors.red[900]),
                ), SizedBox(height: scaler.getHeight(2)),            ElevatedButton(
                  child: Text(
                    "Another worker",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.abel(fontSize: scaler.getTextSize(8), color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      minimumSize:
                      Size(scaler.getWidth(10), scaler.getHeight(2)),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      primary: Colors.orange,
                      // <-- Button color
                      onPrimary: Colors.black),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                )
              ])

          ]),

    );
  }
}
