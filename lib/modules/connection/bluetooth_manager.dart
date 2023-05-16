// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
//
//
// class BluetoothManager {
//   FlutterBlue _flutterBlue = FlutterBlue.instance;
//   BluetoothDevice _esp32Device;
//   late BluetoothCharacteristic _characteristic;
//
//   Future<void> scanAndConnect() async {
//     _flutterBlue.startScan(timeout: Duration(seconds: 5));
//
//     _flutterBlue.scanResults.listen((List<ScanResult> results) {
//       for (ScanResult result in results) {
//         if (result.device.name == 'ESP32') {
//           _esp32Device = result.device;
//           break;
//         }
//       }
//     });
//
//     _flutterBlue.stopScan();
//
//     if (_esp32Device != null) {
//       await _esp32Device.connect();
//       List<BluetoothService> services = await _esp32Device.discoverServices();
//       for (BluetoothService service in services) {
//         if (service.uuid.toString() == 'YOUR_SERVICE_UUID') {
//           _characteristic = service.characteristics.firstWhere(
//                   (c) => c.uuid.toString() == 'YOUR_CHARACTERISTIC_UUID');
//           break;
//         }
//       }
//     }
//   }
//
//   Future<void> sendData(String data) async {
//     if (_characteristic != null) {
//       await _characteristic.write(utf8.encode(data));
//     }
//   }
//
//   Stream<List<int>> receiveData() {
//     if (_characteristic != null) {
//       return _characteristic.value;
//     }
//     return null;
//   }
//
//   Future<void> disconnect() async {
//     if (_esp32Device != null) {
//       await _esp32Device.disconnect();
//     }
//   }
// }