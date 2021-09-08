import 'package:flutter/cupertino.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_who_is_going_to_quit/quitPage.dart';
import 'package:hr_who_is_going_to_quit/wave_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

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
  final time_spend_company = TextEditingController();
  String time_spend_company_str = "";

  @override
  Widget build(BuildContext context) {
    listWidget work_accident = new listWidget(["No", "Yes"], "No");
    listWidget promotion_last_5years = new listWidget(["No", "Yes"], "No");
    listWidget department = new listWidget([
      "sales",
      "technical",
      "support",
      "IT",
      "product_mng",
      "accounting",
      "hr",
      "management",
      "marketing",
      "RandD"
    ], "sales");
    listWidget salary = new listWidget(["low", "medium", "high"], "medium");

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          WaveWidget(Size(scaler.getWidth(100), scaler.getHeight(100)),
              scaler.getHeight(15)),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: scaler.getHeight(2)),
                Center(
                    child: Text(
                  "Who is going to quit?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alef(
                      fontWeight: FontWeight.normal,
                      fontSize: scaler.getTextSize(9),
                      color: Colors.red[900]),
                )),
                Center(
                    child: Text(
                  "Enter the details of your employee",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alef(
                      fontWeight: FontWeight.normal,
                      fontSize: scaler.getTextSize(6),
                      color: Colors.red[900]),
                )),
                newFiled(satisfactionLevel, satisfactionLevel_str,
                    "Satisfaction level (0 - 100%)", false),
                newFiled(lastEvaluation, lastEvaluation_str,
                    "Last evaluation (0 - 100%)", false),
                newFiled(numberProject, numberProject_str, "Number of projects",
                    false),
                newFiled(averageMontlyHours, averageMontlyHours_str,
                    "Average montly hours", false),
                newFiled(time_spend_company, time_spend_company_str,
                    "Time spend company", false),
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
                    style: GoogleFonts.abel(
                        fontSize: scaler.getTextSize(8), color: Colors.white),
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
                    satisfactionLevel_str = satisfactionLevel.text == ""
                        ? "61"
                        : satisfactionLevel.text;
                    lastEvaluation_str =
                        lastEvaluation.text == "" ? "71" : lastEvaluation.text;
                    numberProject_str =
                        numberProject.text == "" ? "4" : numberProject.text;
                    averageMontlyHours_str = averageMontlyHours.text == ""
                        ? "201"
                        : averageMontlyHours.text;
                    time_spend_company_str = time_spend_company.text == ""
                        ? "3"
                        : time_spend_company.text;

                    double satisfactionLevel_d =
                        double.parse(satisfactionLevel_str) / 100;
                    double lastEvaluation_d =
                        double.parse(lastEvaluation_str) / 100;
                    int numberProject_d = int.parse(numberProject_str);
                    int averageMontlyHours_d =
                        int.parse(averageMontlyHours_str);
                    int time_spend_company_d =
                        int.parse(time_spend_company_str);

                    int work_accident_i = work_accident.value == "No" ? 0 : 1;
                    int promotion_last_5years_i =
                        promotion_last_5years.value == "No" ? 0 : 1;

                    var url =
                        Uri.parse('http://yonatangat.pythonanywhere.com/');
                    var x = {
                      "satisfaction_level": satisfactionLevel_d,
                      "last_evaluation": lastEvaluation_d,
                      "number_project": numberProject_d,
                      "average_montly_hours": averageMontlyHours_d,
                      "time_spend_company": time_spend_company_d,
                      "Work_accident": work_accident_i,
                      "promotion_last_5years": promotion_last_5years_i,
                      "department": department.value,
                      "salary": salary.value
                    };
                    print(x);
                    var response = await http.post(url,
                        body: json.encode(x),
                        headers: {'Content-Type': 'application/json'});
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    setState(() {
                    });

                    if (response.body.contains("1")) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => quitPage()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => notQuitPage()));
                    }
                  },
                ),
                SizedBox(height: scaler.getHeight(1))
              ],
            ),
          )
        ],
      ),
    );
  }
}

newFiled(controller, str, text, cover) {
  return new FadeAnimation(
      1.7,
      Column(children: <Widget>[
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
                style: TextStyle(color: Colors.blue[900], fontSize: 18),
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
