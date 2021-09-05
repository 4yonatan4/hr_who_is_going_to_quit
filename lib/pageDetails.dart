import 'package:flutter/cupertino.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_background/animated_background.dart';
import 'package:hr_who_is_going_to_quit/quitPage.dart';
import 'package:hr_who_is_going_to_quit/wave_widget.dart';

import 'FadeAnimation.dart';
import 'package:flutter/material.dart';

import 'listWidget.dart';
import 'notQuitPage.dart';

ScreenScaler scaler = new ScreenScaler();

class pageDetails extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<pageDetails> {
  final satisfactionLevel = TextEditingController();
  String satisfactionLevel_str = "";
  final lastEvaluation = TextEditingController();
  String lastEvaluation_str = "";
  final numberProject = TextEditingController();
  String numberProject_str = "";
  final averageMontlyHours = TextEditingController();
  String averageMontlyHours_str = "";


  @override
  Widget build(BuildContext context) {
    listWidget work_accident = new listWidget(["No","Yes"], "No");
    listWidget promotion_last_5years = new listWidget(["No","Yes"], "No");
    listWidget department = new listWidget(["sales","technical","support","IT","product_mng","accounting","hr","management","marketing","RandD"], "sales");
    listWidget salary = new listWidget(["low","medium","high"], "medium");

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      body: Stack(
          children:[ WaveWidget(Size(scaler.getWidth(100),scaler.getHeight(100)),scaler.getHeight(15)),SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: scaler.getHeight(2)),
              Center(
                child:
              Text(
                "Who is going to quit?",
                textAlign: TextAlign.center,
                style: GoogleFonts.alef(
                    fontWeight: FontWeight.normal,
                    fontSize: scaler.getTextSize(9),
                    color: Colors.red[900]),
              )),
              Center(
                  child:
                  Text(
                    "enter details of your worker",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alef(
                        fontWeight: FontWeight.normal,
                        fontSize: scaler.getTextSize(6),
                        color: Colors.red[900]),
                  )),
              newFiled(satisfactionLevel, satisfactionLevel_str, "Satisfaction Level (0 - 100%)",false),
              newFiled(lastEvaluation, lastEvaluation_str, "Last Evaluation (0 - 100%)", false),
              newFiled(numberProject, numberProject_str, "Number of projects", false),
              newFiled(averageMontlyHours, averageMontlyHours_str, "Average Montly Hours", false),
              SizedBox(height: scaler.getHeight(1)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "       Work accident",
                    style:
                    GoogleFonts.alef(fontSize: 16, color: Colors.black),
                  )),
              SizedBox(height: scaler.getHeight(0.5)),
              work_accident,
              SizedBox(height: scaler.getHeight(1)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "       Promotion in the last 5 years",
                    style:
                    GoogleFonts.alef(fontSize: 16, color: Colors.black),
                  )),

              SizedBox(height: scaler.getHeight(0.5)),
              promotion_last_5years,
              SizedBox(height: scaler.getHeight(1)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "       Department",
                    style:
                    GoogleFonts.alef(fontSize: 16, color: Colors.black),
                  )),
              SizedBox(height: scaler.getHeight(0.5)),
              department,
              SizedBox(height: scaler.getHeight(1)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "       Salary",
                    style:
                    GoogleFonts.alef(fontSize: 16, color: Colors.black),
                  )),
              SizedBox(height: scaler.getHeight(0.5)),
              salary,
              SizedBox(height: scaler.getHeight(1)),
              ElevatedButton(
                child: Text(
                  "Check",
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
                  // print(work_accident.value);
                  // print(promotion_last_5years.value);
                  // print(department.value);
                  // print(salary.value);
                  bool answer = true;
                  if (answer){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => quitPage()));
                  }
                  // else{
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => notQuitPage()));
                  // }
                },
              ),
              SizedBox(height: scaler.getHeight(1))
            ],
          ),
       )],
      ),
    );
  }
}

newFiled(controller, str, text,cover) {
  return new  FadeAnimation(
      1.7, Column(children: <Widget>[
    SizedBox(height: scaler.getHeight(1)),
    Center(
      child: Container(
        alignment: AlignmentDirectional.center,
        width: scaler.getWidth(28),
        height: scaler.getHeight(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black,
                offset: const Offset(0, 0),
                blurRadius: 4.0),
          ],
        ),
        child: TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            controller: controller,
            obscureText: cover,
            style: TextStyle(color:Colors.blue[900],fontSize: 18),
            decoration: InputDecoration(
                // suffixIcon: Icon(
                //   icon,
                //   size: scaler.getTextSize(8),
                //   color: Colors.red,
                // ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: text),
            onChanged: (text) {
              str = controller.text;
            }),
      ),
    ),
  ]));
}

