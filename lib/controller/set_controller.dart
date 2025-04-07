// import 'dart:async';
//
// import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
// import 'package:get/get.dart';
//
// class ScanController extends GetxController {
//   final FlutterReactiveBle ble = FlutterReactiveBle();
//   var devices = <DiscoveredDevice>[].obs;
//   var connectionStatus = "".obs;
//   StreamSubscription<DiscoveredDevice>? scanSubscription;
//
//   @override
//   void onInit() {
//     super.onInit();
//     startScanning();
//   }
//
//   void startScanning() {
//     devices.clear();
//     scanSubscription = ble.scanForDevices(withServices: []).listen((device) {
//       print('devices $devices');
//       if (!devices.any((d) => d.id == device.id)) {
//         devices.add(device);
//       }
//
//     }, onError: (error) {
//       connectionStatus.value = "Scan error: $error";
//     });
//     update();
//   }
//
//
//   Future<void> connectToDevice(DiscoveredDevice device) async {
//     connectionStatus.value = "Connecting to ${device.name}...";
//     try {
//       final connection = ble.connectToDevice(id: device.id);
//       connection.listen((connectionState) {
//         if (connectionState.connectionState == DeviceConnectionState.connected) {
//           connectionStatus.value = "Connected to ${device.name}";
//         } else if (connectionState.connectionState == DeviceConnectionState.disconnected) {
//           connectionStatus.value = "Disconnected from ${device.name}";
//         }
//       }, onError: (error) {
//         connectionStatus.value = "Failed to connect: $error";
//       });
//     } catch (e) {
//       connectionStatus.value = "Error: $e";
//     }
//   }
//
//   @override
//   void onClose() {
//     scanSubscription?.cancel();
//     super.onClose();
//   }
// }
