import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// import 'package:login/timer.dart';

import '../database/SensoGroup.dart';

class SlotsDetails extends StatefulWidget {
  static const String routName = 'details';

  @override
  State<SlotsDetails> createState() => _SlotsDetailsState();
}

class _SlotsDetailsState extends State<SlotsDetails> {
  String state2 = 'Busy';
  String state3 = 'Free';
  String sen1 = '';
  String sen2 = '';
  String sen3 = '';
  String sen4 = '';
  double size1 = 35;
  double size11 = 15;
  SensorGroup? sensors;
  late DatabaseReference dbref;

  // var cubit = ParkingCubit.get(context);
  // late Timer timer;
  // Duration duration=const Duration(minutes: 350);

  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startTimer();
    // timer =Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if(duration.inSeconds==0){
    //     timer.cancel();
    //     return;
    //   }
    //   setState(() {
    //     duration=Duration(seconds: duration.inSeconds-1);
    //   });
    // });
    dbref = FirebaseDatabase.instance.ref();
    getData();
  }

  // double? totalprice;
  // double? totaltime;
  @override
  Widget build(BuildContext context) {
    if (sensors?.sensorOne != null && sensors?.sensorOne == true) {
      sen1 = state3;
    } else {
      sen1 = state2;
    }

    if (sensors?.sensorTwo != null && sensors?.sensorTwo == true) {
      sen2 = state3;
      //print(counter);
    } else {
      sen2 = state2;
    }

    if (sensors?.sensorThree != null && sensors?.sensorThree == true) {
      sen3 = state3;
    } else {
      sen3 = state2;
    }

    if (sensors?.sensorFour != null && sensors?.sensorFour == true) {
      sen4 = state3;
    } else {
      sen4 = state2;
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
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/images/dash2.jpeg'),
          //         fit: BoxFit.fill)),
          margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                // padding: EdgeInsets.all(10),
                color: Colors.transparent,
                child: Row(
                  children: [
                    Text(
                      "Parking Slots Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    // ElevatedButton(
                    //
                    //   style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.amber)),
                    //     onPressed: (){}, child: Text('Add New Parking Slot')),
                  ],
                ),
              ),
              Container(
                color: Color(0x1BFF4081),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    defaultColumnWidth: const FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black12,
                        //style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(children: [
                        // Column(children: [
                        //   Text(' Slot Name',
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 25.0,
                        //           fontWeight: FontWeight.bold))
                        // ]),
                        Column(children: [
                          Text(' Slot ID',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                        Column(children: [
                          Text(' Slot Status',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                        Column(children: [
                          Text('Actions',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                        Column(children: [
                          Text(' Timer',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                        // Column(children: [
                        //   Text(' Total Price',
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 25.0,
                        //           fontWeight: FontWeight.bold))
                        // ]),
                      ]),
                      TableRow(children: [
                        // Column(children: [
                        //   Text('SlotOne',
                        //       style: TextStyle(
                        //           color: Colors.black38,
                        //           fontSize: 22,
                        //           fontWeight: FontWeight.w500))
                        // ]),

                        Column(children: [
                          Text('A-01',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))
                        ]),
                        Column(children: [
                          Text(
                              (sensors?.sensorOne != null &&
                                      sensors?.sensorOne == true)
                                  ? state3
                                  : state2,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400))
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.green,
                                size: (sensors?.sensorOne != null &&
                                        sensors?.sensorOne == true)
                                    ? size1
                                    : size11,
                              ),
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.red,
                                size: (sensors?.sensorOne != null &&
                                        sensors?.sensorOne == true)
                                    ? size11
                                    : size1,
                              )
                            ]),
                        Column(children: [
                          Text(""
                              // (sensors?.sensorOne==true)?ParkingCubit.formatTime(ParkingCubit.timer1):"00:00:00",
                              )
                          //   if (sensors?.sensorOne!=null&&sensors?.sensorOne==true)
                          //     resetTimer(),
                          //   if(sensors?.sensorOne!=null&&sensors?.sensorOne==false)
                          //     MyTimer()
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('A-02',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))
                        ]),
                        Column(children: [
                          Text(
                              (sensors?.sensorTwo != null &&
                                      sensors?.sensorTwo == true)
                                  ? state3
                                  : state2,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300))
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.car_repair_rounded,
                                  color: Colors.green,
                                  size: (sensors?.sensorTwo != null &&
                                          sensors?.sensorTwo == true)
                                      ? size1
                                      : size11),
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.red,
                                size: (sensors?.sensorTwo != null &&
                                        sensors?.sensorTwo == true)
                                    ? size11
                                    : size1,
                              )
                            ]),
                        Column(children: [
                          Text('00'),
                          // if (sensors?.sensorTwo!=null&&sensors?.sensorTwo==true)
                          //   resetTimer(),
                          // if(sensors?.sensorTwo!=null&&sensors?.sensorTwo==false)
                          //   MyTimer()
                          //( sensors?.sensorTwo != null && sensors?.sensorTwo == false)?MyTimer():resetTimer(),
                          // if( sensors?.sensorTwo != null &&
                          //     sensors?.sensorTwo == true)
                          //   resetTimer()
                        ]),
                      ]),
                      TableRow(children: [
                        // Column(children: [
                        //   Text('SlotThree',
                        //       style: TextStyle(
                        //           color: Colors.black38,
                        //           fontSize: 22,
                        //           fontWeight: FontWeight.w500))
                        // ]),
                        Column(children: [
                          Text('A-03',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))
                        ]),
                        Column(children: [
                          Text(
                              (sensors?.sensorThree != null &&
                                      sensors?.sensorThree == true)
                                  ? state3
                                  : state2,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300))
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.green,
                                size: (sensors?.sensorThree != null &&
                                        sensors?.sensorThree == true)
                                    ? size1
                                    : size11,
                              ),
                              Icon(Icons.car_repair_rounded,
                                  color: Colors.red,
                                  size: (sensors?.sensorThree != null &&
                                          sensors?.sensorThree == true)
                                      ? size11
                                      : size1)
                            ]),
                        Column(children: [
                          Text('00'),
                          // if (sensors?.sensorThree!=null&&sensors?.sensorThree==true)
                          //   resetTimer(),
                          // if(sensors?.sensorThree!=null&&sensors?.sensorThree==false)
                          //   MyTimer()
                          //(sensors?.sensorThree != null && sensors?.sensorThree == false)?MyTimer():resetTimer(),
                          // if( sensors?.sensorThree != null &&
                          //     sensors?.sensorThree == true)
                          //   resetTimer()
                        ]),
                        // Column(children: [
                        //   Text('$c',
                        //       style: TextStyle(
                        //           fontSize: 20, fontWeight: FontWeight.w300))
                        // ]),
                      ]),
                      TableRow(children: [
                        // Column(children: [
                        //   Text('SlotFour',
                        //       style: TextStyle(
                        //           color: Colors.black38,
                        //           fontSize: 22,
                        //           fontWeight: FontWeight.w500))
                        // ]),
                        Column(children: [
                          Text(
                            'A-04',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                        Column(children: [
                          Text(
                              (sensors?.sensorFour != null &&
                                      sensors?.sensorFour == true)
                                  ? state3
                                  : state2,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300))
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.green,
                                size: (sensors?.sensorFour != null &&
                                        sensors?.sensorFour == true)
                                    ? size1
                                    : size11,
                              ),
                              Icon(
                                Icons.car_repair_rounded,
                                color: Colors.red,
                                size: (sensors?.sensorFour != null &&
                                        sensors?.sensorFour == true)
                                    ? size11
                                    : size1,
                              )
                            ]),
                        Column(children: [
                          Text('00'),
                          // if (sensors?.sensorFour!=null&&sensors?.sensorFour==true)
                          //       resetTimer(),
                          // if(sensors?.sensorFour!=null&&sensors?.sensorFour==false)
                          //      MyTimer()

                          //( sensors?.sensorFour != null && sensors?.sensorFour == false)?MyTimer():resetTimer(),
                          // if( sensors?.sensorFour != null &&
                          //     sensors?.sensorFour == true)
                          //     resetTimer()
                        ]),
                        // Column(children: [
                        //   Text('$c',
                        //       style: TextStyle(
                        //           fontSize: 20, fontWeight: FontWeight.w300))
                        // ]),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

//  sen1Price(){
//     if (sensors?.sensorOne==true){
//       MyTimer();
//     }
//     else{
//       totalTime1=MyTimer() as String?;
//       print(totalTime1);
//       setState(() => timer!.cancel());
//     }
// }
  void getData() async {
    SensorGroup? sensorGroup;

    var data = await dbref.child('Sensor').onValue.listen((data) {
      sensorGroup = SensorGroup.fromJson(data.snapshot.value);
      setState(() {
        sensors = sensorGroup;
        // print(sensors?.sensorTwo);
        //(sensors != null&&sensors==true)?counter++:c++;
      });
    });
  }
//
// void addTime(){
//   final addSeconds=1;
//   setState(() {
//     final seconds =duration.inSeconds+addSeconds;
//     // MyTimer.totalTime+=addSeconds;
//     duration=Duration(seconds: seconds);
//   });
// }
// void startTimer(){
//   timer=Timer.periodic(Duration(seconds: 1),(_)=>addTime());
// }
// void stopTimer(){
//   // totaltime=MyTimer.totalTime;
//   // print(totaltime);
//   // MyTimer.totalTime=0;
//   setState(() {
//     timer!.cancel();
//
//   }
//   );
//
// }
// Widget resetTimer() {
//   stopTimer();
//   if (context.mounted){
//       setState(() => duration = Duration());}
//   return Text('00:00:00',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),);
// }

// Widget buildTime(){
//
//   String twoDigits(int n)=>n.toString().padLeft(2,'0');
//   final minutes=twoDigits(duration.inMinutes.remainder(60));
//   final seconds=twoDigits(duration.inSeconds.remainder(60));
//   final hours= twoDigits(duration.inHours.remainder(1));
//   // String x=(hours+minutes+seconds) ;
//   // print(x);
//   return Text('$hours:$minutes:$seconds',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
// }
// Widget sensor4Timer(){
//     if (sensors?.sensorFour==false) {
//
//       return buildTime();
//
//     }
//     else{
//       totalTime1=buildTime() as String;
//       print(totalTime1);
//       return resetTimer();
//     }
// }
}
