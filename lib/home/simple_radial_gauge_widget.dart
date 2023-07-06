import 'package:at_gauges/at_Gauges.dart';
import 'package:flutter/material.dart';

import '../my_theme.dart';
// import 'package:login/my_theme.dart';

class MySimpleRadialGuage extends StatelessWidget {
  double actualValue;
  Color gaugeColor;
  String mytitle;

  MySimpleRadialGuage(
      {required this.actualValue,
      required this.gaugeColor,
      required this.mytitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius?.all(Radius.circular(18)),
        // ),
        decoration:
            BoxDecoration(border: Border.all(color: MyTheme.lightPrimaryColor)),
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(15),
        //color: Colors.white,
        child: SimpleRadialGauge(
          actualValue: actualValue,
          maxValue: 4,
          // Optional Parameters
          minValue: 0,
          title: Text(
            mytitle,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color(0xFF56544C)),
          ),
          titlePosition: TitlePosition.bottom,
          unit: 'spaces',
          icon: Icon(Icons.car_crash),
          pointerColor: gaugeColor,
          decimalPlaces: 0,
          isAnimate: true,
          animationDuration: 2000,
          size: 250,
        ),
      ),
    );
  }
}
