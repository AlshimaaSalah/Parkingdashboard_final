import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../database/SensoGroup.dart';

class Totalnumberperday extends StatefulWidget {
  static const String routName = "total number";

  @override
  State<Totalnumberperday> createState() => _TotalnumberperdayState();
}

class _TotalnumberperdayState extends State<Totalnumberperday> {
  double counter = 0;
  double c = 0;
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
// Future.delayed(Duration(hours: 24),() => counter=0,);
    // counter = 0;
    if (sensors?.sensorOne != null && sensors?.sensorOne == false) {
      counter++;
    }
    if (sensors?.sensorTwo != null && sensors?.sensorTwo == false) {
      counter++;
    }
    if (sensors?.sensorThree != null && sensors?.sensorThree == false) {
      counter++;
    }

    if (sensors?.sensorFour != null && sensors?.sensorFour == false) {
      counter++;
    }
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage('assets/images/dash2.jpeg'), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       color: Color(0xFFFF8B07),
          //       border: Border.all(color: Colors.black45),
          //       borderRadius: BorderRadius.circular(20)),
          //   width: MediaQuery.of(context).size.width * .3,
          //   height: MediaQuery.of(context).size.height * .2,
          //   margin: EdgeInsets.symmetric(horizontal: 25),
          //   padding: EdgeInsets.symmetric(vertical: 30),
          //
          //   child: CountDownTimer(),
          // ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xB356544C),
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * .4,
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(vertical: 30),

            //child: Text('hello'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.car_rental_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                //SizedBox(height: 4,),

                Text(
                  "$counter cars",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),

                //SizedBox(height: 4,),

                Text(
                  "Total Car numbers per day",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getData() async {
    SensorGroup? sensorGroup;

    var data = await dbref.child('Sensor').onValue.listen((data) {
      sensorGroup = SensorGroup.fromJson(data.snapshot.value);
      setState(() {
        sensors = sensorGroup;
        // counter = 0;
        // print(sensors?.sensorTwo);
        //(sensors != null&&sensors==true)?counter++:c++;
      });
    });
  }
}
