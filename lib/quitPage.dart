import 'package:flutter/cupertino.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_background/animated_background.dart';
import 'package:hr_who_is_going_to_quit/wave_widget.dart';

import 'FadeAnimation.dart';
import 'package:flutter/material.dart';

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
          children:[ WaveWidget(Size(scaler.getWidth(100),scaler.getHeight(100)),scaler.getHeight(15))]),
    );
  }
}
