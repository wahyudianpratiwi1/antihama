import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hama_apps/helper/notification_helper.dart';
import 'package:hama_apps/model/sensor_model.dart';

class SensorController extends GetxController {
  Rx<Sensor> sensorData = Sensor().obs;
  late DatabaseReference _databaseReference;

  @override
  void onInit() {
    _databaseReference = FirebaseDatabase.instance.ref('Sensor');
    _databaseReference.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(
            event.snapshot.value! as Map<Object?, Object?>);
        print("Raw data from Firebase: $data");
        sensorData.value = Sensor.fromJson(data);
        var sensor = Sensor.fromJson(data);
        print("Sensor data: ${sensorData.value}");
        sensorData.value = sensor;

        if (sensor.motion == 1) {
          // Show alert dialog
          Get.dialog(
            AlertDialog(
              title: Text("Terdeteksi"),
              content: Text("Hama Terdeteksi"),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
          _showLocalNotification(sensor);
        }
      } else {
        sensorData.value = Sensor(
          frekuensi: 0,
          malam: 0,
          manual: 0,
          motion: 0,
          pagi: 0,
          siang: 0,
        );
        _showLocalNotification(Sensor(
          frekuensi: 0,
          malam: 0,
          manual: 0,
          motion: 0,
          pagi: 0,
          siang: 0,
        ));
      }
    });
    super.onInit();
  }

  void _showLocalNotification(Sensor sensor) {
    final motionValue = sensor.motion;
    if (motionValue == 1) {
      NotificationHelper.showNotification(
        title: 'Terdeteksi!!',
        body: 'Hama Terdeteksi!!',
      );
    }
  }

  void updateManual(int value) {
    _databaseReference.update({"Manual": value});
  }
}
