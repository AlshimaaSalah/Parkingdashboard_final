import 'package:flutter/material.dart';

@immutable
abstract class ParkingState {}

class ParkingInitial extends ParkingState {}

class ParkingUpdated extends ParkingState {}
