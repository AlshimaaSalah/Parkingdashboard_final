//
//   import 'dart:async';
// import 'dart:js_util';
//
// import 'package:flutter/material.dart';
//
// class MyTimer extends StatefulWidget {
//   static const String routName = 'timer';
//   // static double minutes=0;
//   // static double seconds=0;
//   // static double hours=0;
//   static double totalTime=0 ;
//   MyTimer();
//     @override
//     State<MyTimer> createState() => _TimerState();
//   }
//
//   class _TimerState extends State<MyTimer> {
//
//   Duration duration=Duration();
//   Timer? timer;
//     @override
//     void initState() {
//     // TODO: implement initState
//     super.initState();
//     startTimer();
//   }
//   void addTime(){
//       final addSeconds=1;
//       if (context.mounted){
//       setState(() {
//         final seconds =duration.inSeconds+addSeconds;
//         duration=Duration(seconds: seconds);
//       });}
//   }
//   void startTimer(){
//       timer=Timer.periodic(Duration(seconds: 1),(_)=>addTime());
//   }
// // void stopTimer(){
// //    timer!.cancel(); //clear the timer variable
// //    super.dispose();
// // }
// //   double? totalTime;
// //   void resetTimer() {
// //     stopTimer();
// //     if (context.mounted){
// //     setState(() => duration = Duration());}
// //   }
//
//     Widget build(BuildContext context) {
//       return Center(child: buildTime());
//     }
//     Widget buildTime(){
//       String twoDigits(int n)=>n.toString().padLeft(2,'0');
//       final minutes=twoDigits(duration.inMinutes.remainder(60));
//       final seconds=twoDigits(duration.inSeconds.remainder(60));
//       final hours= twoDigits(duration.inHours.remainder(1));
//       // String x=(hours+minutes+seconds) ;
//       // print(x);
//       return Text('$hours:$minutes:$seconds',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);
//     }
//   }
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'classes.dart';

class ParkingCubit extends Cubit<ParkingState> {
  ParkingCubit() : super(ParkingInitial());

  bool sensor1 = false;
  bool sensor2 = false;
  bool sensor3 = false;
  bool sensor4 = false;

  int timer1 = 0;
  int timer2 = 0;
  int timer3 = 0;
  int timer4 = 0;

  double totalCost = 0;

  double hourlyRate = 10;

  bool parkingOccupied1 = false;
  bool parkingOccupied2 = false;
  bool parkingOccupied3 = false;
  bool parkingOccupied4 = false;

  String formatTime(int time) {
    int hours = time ~/ 3600;
    int minutes = (time ~/ 60) % 60;
    int seconds = time % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void startTimer(int spot) {
    switch (spot) {
      case 1:
        timer1 = 0;
        Timer.periodic(Duration(seconds: 1), (Timer t) {
          timer1++;
          totalCost = hourlyRate * (timer1 / 3600);
          emit(ParkingUpdated());
        });
        break;
      case 2:
        timer2 = 0;
        Timer.periodic(Duration(seconds: 1), (Timer t) {
          timer2++;
          totalCost = hourlyRate * (timer2 / 3600);
          emit(ParkingUpdated());
        });
        break;
      case 3:
        timer3 = 0;
        Timer.periodic(Duration(seconds: 1), (Timer t) {
          timer3++;
          totalCost = hourlyRate * (timer3 / 3600);
          emit(ParkingUpdated());
        });
        break;
      case 4:
        timer4 = 0;
        Timer.periodic(Duration(seconds: 1), (Timer t) {
          timer4++;
          totalCost = hourlyRate * (timer4 / 3600);
          emit(ParkingUpdated());
        });
        break;
    }
  }

  void updateSensor(int spot, bool value) {
    switch (spot) {
      case 1:
        sensor1 = value;
        parkingOccupied1 = value;
        if (!value) {
          timer1 = 0;
          totalCost = 0;
        } else {
          startTimer(1);
        }
        emit(ParkingUpdated());
        break;
      case 2:
        sensor2 = value;
        parkingOccupied2 = value;
        if (!value) {
          timer2 = 0;
          totalCost = 0;
        } else {
          startTimer(2);
        }
        emit(ParkingUpdated());
        break;
      case 3:
        sensor3 = value;
        parkingOccupied3 = value;
        if (!value) {
          timer3 = 0;
          totalCost = 0;
        } else {
          startTimer(3);
        }
        emit(ParkingUpdated());
        break;
      case 4:
        sensor4 = value;
        parkingOccupied4 = value;
        if (!value) {
          timer4 = 0;
          totalCost = 0;
        } else {
          startTimer(4);
        }
        emit(ParkingUpdated());
        break;
    }
  }
}
