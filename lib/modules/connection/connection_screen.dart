
import 'dart:async';
import 'dart:convert'show utf8;
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:graduation_project/modules/settings/settings_screen.dart';
import 'package:graduation_project/shared/components/components.dart';

class WifiSetter extends StatefulWidget {
  @override
  _WifiSetterState createState() => _WifiSetterState();
}

class _WifiSetterState extends State<WifiSetter> {
  final String SERVICE_UUID = "7A0247E7-8E88-409B-A959-AB5092DDB03E";
  final String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  final String TARGET_DEVICE_NAME = "ESP32";

  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  StreamSubscription<ScanResult>? scanSubscription;

  BluetoothDevice? targetDevice;
  BluetoothCharacteristic? targetCharacteristic;

  String connectionText = "";

  @override
  void initState() {
    super.initState();
    startScan();
  }

  startScan() {
    setState(() {
      connectionText = "Start Scanning";
    });

    scanSubscription = flutterBlue.scan().listen((scanResult) {
      print(scanResult.device.name);
      if (scanResult.device.name.contains(TARGET_DEVICE_NAME)) {
        stopScan();

        setState(() {
          connectionText = "Found Target Device";
        });

        targetDevice = scanResult.device;
        connectToDevice();
      }
    }, onDone: () => stopScan());
  }

  stopScan() {
    scanSubscription?.cancel();
    scanSubscription = null;
  }

  connectToDevice() async {
    if (targetDevice == null) {
      return;
    }

    setState(() {
      connectionText = "Device Connecting";
    });

    await targetDevice!.connect();

    setState(() {
      connectionText = "Device Connected";
    });

    discoverServices();
  }

  disconnectFromDeivce() {
    if (targetDevice == null) {
      return;
    }

    targetDevice!.disconnect();

    setState(() {
      connectionText = "Device Disconnected";
    });
  }

  discoverServices() async {
    if (targetDevice == null) {
      return;
    }

    List<BluetoothService> services = await targetDevice!.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UUID) {
        service.characteristics.forEach((characteristics) {
          if (characteristics.uuid.toString() == CHARACTERISTIC_UUID) {
            targetCharacteristic = characteristics;
            setState(() {
              connectionText = "All Ready with ${targetDevice!.name}";
            });
          }
        });
      }
    });
  }

  writeData(String data) async {
    if (targetCharacteristic == null) return;

    List<int> bytes = utf8.encode(data);
    await targetCharacteristic!.write(bytes);
  }

  @override
  void dispose() {
    super.dispose();
    stopScan();
  }

  submitAction() {
    var wifiData = '${wifiNameController.text},${wifiPasswordController.text}';
    writeData(wifiData);
  }

  TextEditingController wifiNameController = TextEditingController();
  TextEditingController wifiPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.00,
        centerTitle:true ,
        leading:IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF063C14),
            size: 25,
          ) ,
          onPressed:(){
            stopScan();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          } ,
        ) ,
        title: Text(
          connectionText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4d4d4d),
          ),
        ),
      ),
      body: Container(
          child: targetCharacteristic == null
              ? Center(
            child: Text(
              "Waiting...",
              style: TextStyle(fontSize: 34, color: Colors.red),
            ),
          )
              : Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: wifiNameController,
                  decoration: InputDecoration(labelText: 'Wifi Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: wifiPasswordController,
                  decoration: InputDecoration(labelText: 'Wifi Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: defaultLogInOutButton(
                    buttonText: 'Submit',
                    onPressed: submitAction,
                  wid: 200,
                  high: 200,
                ),
              )
            ],
          )),
    );
  }
}
