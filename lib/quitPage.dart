import 'package:flutter/cupertino.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_background/animated_background.dart';
import 'package:hr_who_is_going_to_quit/wave_widget.dart';

import 'FadeAnimation.dart';
import 'package:flutter/material.dart';

import 'pageDetails.dart';

ScreenScaler scaler = new ScreenScaler();

class quitPage extends StatefulWidget {

  @override
  _quitPageState createState() => _quitPageState();
}

class _quitPageState extends State<quitPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[ WaveWidget(Size(scaler.getWidth(100),scaler.getHeight(100)),scaler.getHeight(18)),Column(
            children:[  SizedBox(height: scaler.getHeight(3)),Image(
              alignment: Alignment.topCenter,
                height: scaler.getHeight(12),
                width: scaler.getHeight(100) ,
                image: NetworkImage(
                    "https://media.istockphoto.com/vectors/angry-business-manager-shouting-at-his-business-team-vector-id1182587209?k=20&m=1182587209&s=612x612&w=0&h=SV2TJ7aLYx84oOFWQPSEAYe2SPOZoEVvoAU-dHmwLCE=")),
              SizedBox(height: scaler.getHeight(4)),Text(
    "Your worker",
    textAlign: TextAlign.center,
    style: GoogleFonts.alef(
    fontWeight: FontWeight.normal,
    fontSize: scaler.getTextSize(11),
    color: Colors.red[900]),
    ),Text(
                "will quit!",
                textAlign: TextAlign.center,
                style: GoogleFonts.alef(
                    fontWeight: FontWeight.bold,
                    fontSize: scaler.getTextSize(11),
                    color: Colors.red[900]),
              ),
              SizedBox(height: scaler.getHeight(2)),            ElevatedButton(
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
