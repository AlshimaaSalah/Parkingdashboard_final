import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduation_dashboard/home/simple_radial_gauge_widget.dart';

import '../database/SensoGroup.dart';
import '../my_theme.dart';

class TotalSpaces extends StatefulWidget {
  static const String routName = 'total';

  @override
  State<TotalSpaces> createState() => _TotalSpacesState();
}

class _TotalSpacesState extends State<TotalSpaces> {
  double counter = 0;
  late DatabaseReference dbref;
  SensorGroup? sensors;

  void initState() {
    // TODO: implement initState
    super.initState();
    dbref = FirebaseDatabase.instance.ref();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    counter = 0;
    if (sensors?.sensorOne != null && sensors?.sensorOne == true) {
      counter++;
    }

    if (sensors?.sensorTwo != null && sensors?.sensorTwo == true) {
      counter++;
    }

    if (sensors?.sensorThree != null && sensors?.sensorThree == true) {
      counter++;
    }

    if (sensors?.sensorFour != null && sensors?.sensorFour == true) {
      counter++;
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.white,
        //   title: Text(
        //     'Smart Barking Dashboard',
        //     style: TextStyle(
        //         fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        //   ),
        // ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/dash2.jpeg'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MySimpleRadialGuage(
                            actualValue: counter,
                            gaugeColor: Color(0x6E56544C),
                            mytitle: "Empty Parking Spaces"),
                        MySimpleRadialGuage(
                            actualValue: 4 - counter,
                            gaugeColor: MyTheme.lightPrimaryColor,
                            mytitle: "Busy Parking Spaces"),
                      ])),
            ],
          ),
        ));
  }

  void getData() async {
    SensorGroup? sensorGroup;

    var data = await dbref.child('Sensor').onValue.listen((data) {
      sensorGroup = SensorGroup.fromJson(data.snapshot.value);
      setState(() {
        sensors = sensorGroup;
        counter = 0;
        // print(sensors?.sensorTwo);
        //(sensors != null&&sensors==true)?counter++:c++;
      });
    });
  }
}
