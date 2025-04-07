// import 'dart:async';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smart_watch/core/PreferenceUtils.dart';
// import 'package:smart_watch/core/widget/custom_snackbar.dart';
// import 'dart:io';
// import '../../../controller/set_controller.dart';
// import '../widget/radar_painter.dart';
// import 'dart:math';
// import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class ScanScreen extends StatefulWidget {
//   const ScanScreen({super.key});
//
//   @override
//   _ScanScreenState createState() => _ScanScreenState();
// }
//
// class _ScanScreenState extends State<ScanScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   final FlutterReactiveBle _ble = FlutterReactiveBle();
//   late Stream<DiscoveredDevice> _scanStream;
//   List<DiscoveredDevice> _devices = [];
//   String _connectionStatus = "";
//   StreamSubscription<DiscoveredDevice>? _scanSubscription;
//   final ScanController controller = Get.put(ScanController());
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat();
//
//     // طلب الأذونات وبدء المسح
//     requestPermissionsAndStartScanning();
//     // startScanning();
//
//   }
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _devices.clear(); // تفريغ القائمة لعرض الأجهزة الجديدة
//     requestPermissionsAndStartScanning();
//   }
//
//   Future<void> requestPermissionsAndStartScanning() async {
//     // تحقق من الأذونات
//     if (await _checkPermissions()) {
//       // إذا تم منح جميع الأذونات، ابدأ المسح
//       startScanning();
//     } else {
//       print("Some permissions are still denied.");
//       openAppSettings();  // فتح إعدادات الأذونات
//     }
//   }
//
//   Future<bool> _checkPermissions() async {
//     bool allGranted = true;
//
//     // if (!await Permission.bluetooth.isGranted) {
//     //   print("Bluetooth permission is missing");
//     //   allGranted = false;
//     // }
//     //
//     // if (!await Permission.bluetoothScan.isGranted) {
//     //   print("Bluetooth Scan bluetoothScan is missing");
//     //   allGranted = false;
//     // }
//
//     // if (!await Permission.bluetoothConnect.isGranted) {
//     //   print("Bluetooth Connect permission is missing");
//     //   allGranted = false;
//     // }
//     //
//     // if (!await Permission.location.isGranted) {
//     //   print("Location permission is missing");
//     //   allGranted = false;
//     // }
//
//     return allGranted;
//   }
//
//   Future<void> requestPermissions() async {
//     if (await Permission.bluetooth.isGranted == false) {
//       await Permission.bluetooth.request();
//     }
//     if (await Permission.bluetoothScan.isGranted == false) {
//       await Permission.bluetoothScan.request();
//     }
//     if (await Permission.bluetoothConnect.isGranted == false) {
//       await Permission.bluetoothConnect.request();
//     }
//     if (await Permission.location.isGranted == false) {
//       await Permission.location.request();
//     }
//   }
//
//   Future<void> connectToDevice(DiscoveredDevice device) async {
//     setState(() {
//       if (!_devices.any((d) => d.id == device.id)) {
//         _devices.add(device); // إضافة الجهاز إذا لم يكن موجودًا
//       }
//       _connectionStatus = "Connecting to ${device.name}...";
//     });
//
//     try {
//       final connection = _ble.connectToDevice(id: device.id);
//       connection.listen((connectionState) {
//         if (connectionState.connectionState == DeviceConnectionState.connected) {
//           setState(() {
//             _connectionStatus = "Connected to ${device.name}";
//             saveDeviceLocally(device);
//
//             showCustomSnackBar(_connectionStatus, isError: false);
//           });
//         } else if (connectionState.connectionState == DeviceConnectionState.disconnected) {
//           setState(() {
//             _connectionStatus = "Disconnected from ${device.name}";
//           });
//         }
//       }, onError: (error) {
//         setState(() {
//           _connectionStatus = "Failed to connect to ${device.name}: $error";
//         });
//       });
//     } catch (e) {
//       setState(() {
//         _connectionStatus = "Error connecting to ${device.name}: $e";
//       });
//     }
//   }
//
//
//   Future<void> connectAndFetchData(DiscoveredDevice device) async {
//     setState(() {
//       _connectionStatus = "Connecting to ${device.name}...";
//     });
//
//     try {
//       final connection = _ble.connectToDevice(id: device.id);
//       connection.listen((connectionState) async {
//         if (connectionState.connectionState == DeviceConnectionState.connected) {
//           setState(() {
//             _connectionStatus = "Connected to ${device.name}";
//           });
//
//           // جلب البيانات من الساعة
//           final fetchedData = await fetchDataFromDevice(device);
//
//           // الانتقال إلى الشاشة الجديدة مع البيانات
//           if (context.mounted) {
//             Get.back(result:fetchedData);
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => DeviceDataScreen(data: fetchedData),
//             //   ),
//             // );
//           }
//         } else if (connectionState.connectionState == DeviceConnectionState.disconnected) {
//           setState(() {
//             _connectionStatus = "Disconnected from ${device.name}";
//           });
//         }
//       }, onError: (error) {
//         setState(() {
//           _connectionStatus = "Failed to connect to ${device.name}: $error";
//         });
//       });
//     } catch (e) {
//       setState(() {
//         _connectionStatus = "Error connecting to ${device.name}: $e";
//       });
//     }
//   }
//
//   Future<String> fetchDataFromDevice(DiscoveredDevice device) async {
//     try {
//       // تحديد UUID للخدمة والخاصية
//       final serviceUuid = Uuid.parse("YOUR_SERVICE_UUID");
//       final characteristicUuid = Uuid.parse("YOUR_CHARACTERISTIC_UUID");
//
//       // قراءة البيانات من الخاصية
//       final characteristic = QualifiedCharacteristic(
//         serviceId: serviceUuid,
//         characteristicId: characteristicUuid,
//         deviceId: device.id,
//       );
//
//       final value = await _ble.readCharacteristic(characteristic);
//
//       // تحويل البيانات إلى نص لعرضها
//       return String.fromCharCodes(value);
//     } catch (e) {
//       return "Failed to fetch data: $e";
//     }
//   }
//   void startScanning() {
//     _devices.clear();
//     _scanSubscription = _ble.scanForDevices(withServices: []).listen((device) {
//       if (mounted) {
//         setState(() {
//           if (!_devices.any((d) => d.id == device.id)) {
//             _devices.add(device);
//           }
//         });
//       }
//     }, onError: (error) {
//       if (mounted) {
//         setState(() {
//           print("Error: $error");
//         });
//       }
//     });
//   }
//
//
//   Future<void> saveDeviceLocally(DiscoveredDevice device) async {
//     await PreferenceUtils.setId(device.id);
//     await PreferenceUtils.setName(device.name);
//
//   }
//
//   Future<void> loadPairedDevice() async {
//     final id = PreferenceUtils.getId();
//     final name = PreferenceUtils.getName();
//     if (id != null && name != null) {
//       setState(() {
//         _devices.add(DiscoveredDevice(
//             id: id,
//             name: name,
//             serviceData: {},
//             manufacturerData: Uint8List.fromList([]), // استخدام قائمة فارغة كـ Uint8List
//             rssi: 0,
//             serviceUuids: []
//         ));
//       });
//     }
//   }
//
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _scanSubscription?.cancel(); // إلغاء الاشتراك
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: const Text('Scan'),
//         leading: IconButton(
//           icon: const Icon(Icons.close),
//           onPressed: () {
//             Navigator.pop(context); // العودة للخلف
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: _devices.isEmpty
//                 ? const Center(
//               child: Text(
//                 "Scanning for devices...",
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//             )
//                 : ListView.builder(
//               itemCount: _devices.length,
//               itemBuilder: (context, index) {
//                 final device = _devices[index];
//                 return ListTile(
//                   leading: const Icon(Icons.bluetooth, color: Colors.teal),
//                   title: Text(device.name.isNotEmpty ? device.name : "Unknown Device"),
//                   subtitle: Text("ID: ${device.id}"),
//                   onTap: () {
//                     connectToDevice(device);
//
//                     print("Selected device: ${device.name}");
//                   },
//                 );
//               },
//             ),
//           ),
//           if (_connectionStatus.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 _connectionStatus,
//                 style: const TextStyle(fontSize: 16, color: Colors.teal),
//               ),
//             ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Transform.rotate(
//                   angle: _controller.value * 2 * pi,
//                   child: CustomPaint(
//                     size: const Size(100, 100),
//                     painter: RadarPainter(),
//                   ),
//                 );
//               },
//             ),
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constants/styles.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../widget/radar_painter.dart';

class ScanScreen extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Scan Devices',isActions: false,backgroundColor: Theme.of(context).primaryColor,colorTitle: Colors.white,),

      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.devices.isEmpty) {
                return Center(
                  child: Text("Searching to find any devices.",style: robotoMedium.copyWith(color: Colors.grey)),
                );
              }
              return ListView.builder(
                itemCount: controller.devices.length,
                itemBuilder: (context, index) {
                  final device = controller.devices[index];
                  return ListTile(
                    leading: Icon(Icons.bluetooth),
                    title: Text(device.name.isNotEmpty ? device.name : "Unknown Device"),
                    subtitle: Text("ID: ${device.id}"),
                    onTap: () => controller.connectToDevice(device),
                  );
                },
              );
            }),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: controller.animationController.value * 2 * pi,
                  child: CustomPaint(
                    size: const Size(100, 100),
                    painter: RadarPainter(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
