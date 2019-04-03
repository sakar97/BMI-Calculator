import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(new MaterialApp(
    title: 'BMI Calculator',
    theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        accentColor: Colors.redAccent),
    debugShowCheckedModeBanner: false,
    home: BMI()));

class BMI extends StatefulWidget {
  @override
  BMIState createState() => BMIState();
}

class BMIState extends State<BMI> {
  List<DropdownMenuItem<String>> listdrop = [];
  List<String> _list = ["Kg", "Lbs"];
  String selected = null;
  String bmiResult = "";
  String bmiStatus = "";
  String _weightType = "Kg";
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

  void loaddata() {
    listdrop = [];
    listdrop = _list
        .map((val) => new DropdownMenuItem<String>(
              child: new Text(val),
              value: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    loaddata();
    return Scaffold(
      resizeToAvoidBottomPadding: false,//
        appBar: AppBar(
          title: Text("BMI Calculator"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Center(
            child: Container(
                child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(40.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: _weight,
                        decoration:
                            InputDecoration(labelText: "Enter your Weight"),
                        keyboardType: TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                      ),
                    ),
                    Flexible(
                        child: new SingleChildScrollView(
                      child: new Center(
                          child: DropdownButtonHideUnderline(
                              child: new DropdownButton(
                                  value: selected,
                                  items: listdrop,
                                  hint: new Text('Select Type'),
                                  onChanged: (value) {
                                    selected = value;
                                    if (selected == "Kg") {
                                      _weightType = "Kg";
                                    } else {
                                      _weightType = "Lbs";
                                    }
                                    setState(() {});
                                  }))),
                    ))
                  ],
                )),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(40.0),
              child: Center(
                child: TextField(
                  controller: _height,
                  decoration:
                      InputDecoration(labelText: "Enter your Height in cm"),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                ),
              ),
            ),
            Flexible(
                fit: FlexFit.loose,
                child: ButtonTheme(
                  minWidth: 250.00,
                  height: 40,
                  child: FlatButton(
                      child: Text("Calculate"),
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      splashColor: Colors.blue,
                      padding: EdgeInsets.only(
                          top: 10, left: 24, right: 24, bottom: 10),
                      onPressed: _handleCalculation),
                )),
            bmiRes(bmiResult),
            bmiStat(bmiStatus),
          ],
        ))));
  }

  Widget bmiRes(bmiRes) {
    bool canShow = false;
    String _bmiRes = bmiRes;
    if (_bmiRes.length > 0) {
      canShow = true;
    }
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: canShow
            ? Column(
                children: [
                  Text(
                    "Your Body Mass Index is",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                      child: Text(
                    _bmiRes,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ))
                ],
              )
            : Container());
  }

  Widget bmiStat(bmiStat) {
    bool canshow=false;
    if(bmiStat!=""){
      canshow=true;
    }
    String _bmistat = bmiStat;
    return Container(
      child: canshow ?
      Column(
        children: [
          Text(
            "This is considered",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
              child: Text(
            _bmistat,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ))
        ],
      ) : Container()
    );
  }

  void _handleCalculation() {
    double bmi = 0.0;
    double Height = double.parse(_height.text) / 100;
    double _wtype = _weightType == "Kg"
        ? double.parse(_weight.text)
        : int.parse(_weight.text) * 0.453592;
    bmi = _wtype / (Height * Height);
    bmiResult = bmi.toStringAsFixed(2);
    if (bmi < 18.5) {
      bmiStatus = "UnderWeight";
    } else if (bmi > 18.5 && bmi < 24.9) {
      bmiStatus = "Normal";
    } else if (bmi > 25.0 && bmi < 29.9) {
      bmiStatus = "OverWeight";
    } else if (bmi > 30.0) {
      bmiStatus = "Obese";
    }
    setState(() {});
  }
}
