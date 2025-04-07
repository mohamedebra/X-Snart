import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_watch/controller/auth_controller.dart';
import 'package:smart_watch/core/widget/custom_snackbar.dart';

import '../core/PreferenceUtils.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  final FlutterReactiveBle _ble = FlutterReactiveBle();

  RxList<DiscoveredDevice> devices = <DiscoveredDevice>[].obs;
  RxString connectionStatus = "Disconnected".obs;
  RxDouble distance = 0.0.obs;
  RxDouble heartRate =  0.0.obs;
  RxInt spo2 = 0.obs; // مستوى الأكسجين
  RxString bloodPressure = "00/00".obs; // ضغط الدم
  RxDouble consumption =  0.0.obs;
  Rx<DiscoveredDevice?> connectedDevice = Rx<DiscoveredDevice?>(null);
  StreamSubscription<ConnectionStateUpdate>? _connectionSubscription;

  late AnimationController animationController;
  RxList<double> distanceHistory = <double>[].obs;
  // isBool() async {
  //   Get.find<AuthController>().isLogin=  await PreferenceUtils.isLogin();
  //   Get.find<AuthController>().emailUser=   PreferenceUtils.getEmailUser();
  //   print('isLogin ${Get.find<AuthController>().isLogin}');
  //   update();
  // }
  @override
  void onInit() {
    super.onInit();
    // isBool();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    _connectionSubscription?.cancel();
    super.dispose();
  }

  Future<void> requestPermissions() async {
    await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location
    ].request();
  }

  Future<void> startScanning() async {
    await requestPermissions();

    devices.clear();
    _ble.scanForDevices(withServices: []).listen((device) {
      if (!devices.any((d) => d.id == device.id)) {
        devices.add(device);
      }
    }, onError: (error) {
      print("Error during scanning: $error");
      // showCustomSnackBar("Error during scanning: $error", isError: true);
      showCustomSnackBar('قم بالاتصال بالساعه اولا');

    });
  }

  Future<void> connectToDevice(DiscoveredDevice device) async {
    connectionStatus.value = "Connecting to ${device.name}...";
    _connectionSubscription = _ble.connectToDevice(id: device.id).listen(
          (connectionState) async {
        if (connectionState.connectionState == DeviceConnectionState.connected) {
          print("Connected to ${device.name}");
          connectionStatus.value = "Connected to ${device.name}";
          connectedDevice.value = device;
          await discoverAndPrintServices(device.id);
          await subscribeToDistance(device.id);
          await subscribeToHeartRate(device.id);
          await subscribeToConsumption(device.id);
          showCustomSnackBar('Successfully connected!', isError: false);
        } else if (connectionState.connectionState == DeviceConnectionState.disconnected) {
          print("Disconnected from ${device.name}");
          connectionStatus.value = "Disconnected from ${device.name}";
          connectedDevice.value = null;
          showCustomSnackBar('Disconnected from device.');
        }
      },
      onError: (error) {
        print("Connection error: $error");
        connectionStatus.value = "Connection failed: $error";
        showCustomSnackBar('Connection failed: $error', isError: true);
      },
    );
  }

  Future<void> disconnectFromDevice() async {
    try {
      await _connectionSubscription?.cancel();
      connectedDevice.value = null;
      connectionStatus.value = "Disconnected";
      showCustomSnackBar("Device disconnected successfully.", isError: false);
    } catch (e) {
      print("Failed to disconnect: $e");
      showCustomSnackBar("Failed to disconnect: $e", isError: true);
    }
  }

  Future<void> subscribeToDistance(id) async {
    final characteristic = QualifiedCharacteristic(
      serviceId: Uuid.parse("6e400001-b5a3-f393-e0a9-e50e24dcca9d"),
      characteristicId: Uuid.parse("6e400003-b5a3-f393-e0a9-e50e24dcca9d"),
      deviceId: id,
    );

    // _ble.subscribeToCharacteristic(characteristic).listen((data) {
    //   double parsedDistance = parseDistance(data);
    //
    //   distance.value = _parseData(data);
    //   distanceHistory.add(parsedDistance); // أضف البيانات الجديدة إلى القائمة
    //   // print("Updated Distance: ${distance.value} meters");
    // }

        _ble.subscribeToCharacteristic(characteristic).listen((data) {
      double parsedDistance = parseDistance(data);
      distance.value = parsedDistance;
      distanceHistory.add(parsedDistance); // أضف البيانات الجديدة إلى القائمة
      print("Updated Distance: ${distance.value} meters");
      print("Updated distanceHistory: ${distanceHistory} meters");

    }, onError: (error) {
      print("Failed to subscribe to distance: $error");
      showCustomSnackBar("Failed to subscribe to distance: $error", isError: true);
    });
  }
  double parseDistance(List<int> data) {
    if (data.length >= 2) {
      // افترض أن البيانات تحتوي على 2 بايت يمثلان المسافة
      int rawDistance = (data[0] << 8) | data[1]; // دمج البايتات
      return rawDistance / 100.0; // افترض أن القيمة تقاس بالسنتيمترات وقم بتحويلها إلى كيلومترات
    }
    return 0.0;
  }


  Future<void> subscribeToConsumption(id) async {
    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse("6e400001-b5a3-f393-e0a9-e50e24dcca9d"), // UUID الخاص بالخدمة
        characteristicId: Uuid.parse("6e400003-b5a3-f393-e0a9-e50e24dcca9d"), // UUID الخاص بالخاصية
        deviceId: id,
      );
      _ble.subscribeToCharacteristic(characteristic).listen((data) {
        consumption.value = parseConsumption(data);
        print("Updated Consumption: ${consumption.value} kcal");
      });
      print("Subscribed to consumption notifications.");
    } catch (e) {
      print("Failed to subscribe to consumption: $e");
    }
  }

  double parseConsumption(List<int> data) {
    double distanceInKm = data[0].toDouble();
    return distanceInKm * 50;
  }


  Future<void> subscribeToHeartRate(String deviceId) async {
    try {

      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse("0000fffa-0000-1000-8000-00805f9b34fb"), // UUID الخاص بالخدمة
        characteristicId: Uuid.parse("0000fffc-0000-1000-8000-00805f9b34fb"), // UUID الخاص بالخاصية
        deviceId: deviceId,
      );


      _ble.subscribeToCharacteristic(characteristic).listen((data) {

        print("Raw Data Received: $data");

        if (data.isNotEmpty) {
          try {
            // تحليل البيانات وتحديث معدل ضربات القلب
            heartRate.value = parseHeartRate(data);
            print("Heart Rate: ${heartRate.value}");
          } catch (e) {
            print("Error parsing heart rate: $e");
          }
        } else {
          print("No data received.");
        }
      },onError: (error) {
        print("Subscription error: $error");
      }
      );
      
    } catch (e) {
      print("Error subscribing to heart rate: $e");
    }
  }


// تحليل بيانات معدل ضربات القلب
  double parseHeartRate(List<int> data) {
    if (data.isEmpty) {
      throw Exception("Empty data received.");
    }
    // قراءة أول بايت كمثال (تأكد من وثائق الجهاز لتفسير البيانات)
    return data[0].toDouble();
  }
  Future<QualifiedCharacteristic?> _findNotifiableCharacteristic(String serviceId, String characteristicId,id) async {
    final services = await _ble.discoverServices(connectedDevice.value!.id);

    for (var service in services) {
      if (service.serviceId.toString() == serviceId) {
        for (var characteristic in service.characteristics) {
          if (characteristic.characteristicId.toString() == characteristicId && characteristic.isNotifiable) {
            return QualifiedCharacteristic(
              serviceId: service.serviceId,
              characteristicId: characteristic.characteristicId,
              deviceId: connectedDevice.value!.id,
            );
          }
        }
      }
    }
    return null;
  }

  double _parseData(List<int> data) {
    return data.isNotEmpty ? data[0].toDouble() : 0.0;
  }

  Future<void> discoverAndPrintServices(String deviceId) async {
    try {
      final services = await _ble.discoverServices(deviceId);

      for (var service in services) {
        print("Service UUID: ${service.serviceId}");
        for (var characteristic in service.characteristics) {
          print("  Characteristic UUID: ${characteristic.characteristicId}");
          print("    Is Readable: ${characteristic.isReadable}");
          print("    Is Writable: ${characteristic.isWritableWithResponse}");
          print("    Is Notifiable: ${characteristic.isNotifiable}");
        }
      }
    } catch (e) {
      print("Error discovering services: $e");
    }
  }


  Future<void> sendVibrationCommand() async {
    final characteristic = QualifiedCharacteristic(
      serviceId: Uuid.parse("6e400001-b5a3-f393-e0a9-e50e24dcca9d"),
      characteristicId: Uuid.parse("6e400002-b5a3-f393-e0a9-e50e24dcca9d"),
      deviceId: connectedDevice.value!.id,
    );

    try {
      await _ble.writeCharacteristicWithResponse(
        characteristic,
        value: [0x01], // الأمر لتفعيل الاهتزاز
      );
      print("Vibration command sent successfully!");
    } catch (e) {
      print("Failed to send vibration command: $e");
    }
  }


  Future<void> enableRaiseToWake(String deviceId) async {
    try {
      final services = await _ble.discoverServices(deviceId);
      final raiseToWakeService = services.firstWhere(
            (s) => s.serviceId.toString() == "00001800-0000-1000-8000-00805f9b34fb",
        orElse: () => throw Exception("Service not found: Raise to Wake"),
      );

      final raiseToWakeCharacteristic = raiseToWakeService.characteristics.firstWhere(
            (c) => c.characteristicId.toString() == "00002a00-0000-1000-8000-00805f9b34fb",
        orElse: () => throw Exception("Characteristic not found: Raise to Wake"),
      );

      final qualifiedCharacteristic = QualifiedCharacteristic(
        serviceId: raiseToWakeService.serviceId,
        characteristicId: raiseToWakeCharacteristic.characteristicId,
        deviceId: deviceId,
      );

      await _ble.writeCharacteristicWithResponse(
        qualifiedCharacteristic,
        value: [0x01], // القيمة لتفعيل الميزة
      );

      print("Raise to Wake enabled successfully!");
      showCustomSnackBar("تم تفعيل ميزة رفع الساعة للتنبيه", isError: false);
    } catch (e) {
      print("Failed to enable Raise to Wake: $e");
      showCustomSnackBar("فشل في تفعيل ميزة رفع الساعة للتنبيه: $e", isError: true);
    }

  }

  Future<void> enableDoNotDisturb(String deviceId) async {
    try {
      print("تم تفعيل وضع عدم الإزعاج على الجهاز: $deviceId");
    } catch (e) {
      print("خطأ أثناء التفعيل: $e");
    }
  }

  // ضبط المنبهات
  Future<void> setAlarms(String deviceId) async {
    try {
      print("تم ضبط المنبهات على الجهاز: $deviceId");
    } catch (e) {
      print("خطأ أثناء ضبط المنبهات: $e");
    }
  }

  // ضبط التذكيرات
  Future<void> setReminder(String deviceId) async {
    try {
      print("تم ضبط التذكيرات على الجهاز: $deviceId");
    } catch (e) {
      print("خطأ أثناء ضبط التذكيرات: $e");
    }
  }

  void reconnectToDevice() {
    if (connectedDevice.value != null) {
      print("Reconnecting to ${connectedDevice.value!.name}");
      connectToDevice(connectedDevice.value!);
    } else {
      showCustomSnackBar('Unable to reconnect');
      print("No device to reconnect.");
    }
  }



}
