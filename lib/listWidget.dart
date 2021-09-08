import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class listWidget extends StatefulWidget {
  final List<String> array;
  String value;

  listWidget(this.array, this.value);

  @override
  _listWidgetState createState() => _listWidgetState();
}

class _listWidgetState extends State<listWidget> {
  final status = TextEditingController();
  ScreenScaler scaler = new ScreenScaler();

  @override
  Widget build(BuildContext context) {
    List<String> a = this.widget.array;
    return Container(
        alignment: AlignmentDirectional.centerEnd,
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
        child: DropdownButton<String>(
          iconDisabledColor: Colors.black,
          isExpanded: true,
          value: this.widget.value,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: scaler.getTextSize(9),
          // this increase the size
          elevation: 100,
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: scaler.getTextSize(7),
          ),
          underline: Container(),
          onChanged: (String? newValue) {
            setState(() {
              this.widget.value = newValue!;
            });
          },
          items: a.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(child: Text(value, textAlign: TextAlign.center)),
            );
          }).toList(),
        ));
  }
}
