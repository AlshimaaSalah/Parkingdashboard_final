class SensorGroup {
  bool? sensorOne;
  bool? sensorTwo;
  bool? sensorThree;
  bool? sensorFour;

  SensorGroup({required this.sensorOne,
    required this.sensorTwo,
    required this.sensorThree,
    required this.sensorFour});

  SensorGroup.fromJson(dynamic data)
      : this(
    sensorOne: data['sensorOne'],
    sensorTwo: data['sensorTwo'],
    sensorThree: data['sensorThree'],
    sensorFour: data['sensorFour'],
  );

  Map<String, dynamic> toJson() {
    return {};
  }
}
