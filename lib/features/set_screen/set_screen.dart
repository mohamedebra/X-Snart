import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_watch/core/PreferenceUtils.dart';
import 'package:smart_watch/features/set_screen/screen/scan_screen.dart';

import '../../controller/home_controller.dart';
import '../../core/constants/images.dart';
import '../../core/constants/styles.dart';
import '../../core/widget/custom_snackbar.dart';
import '../home_screen/screen/heart_rate_app.dart';
import '../home_screen/screen/step_details_screen.dart';

class SetScreen extends StatefulWidget {
  const SetScreen({super.key, required this.name});

  final String name;
  @override
  State<SetScreen> createState() => _SetScreenState();
}

class _SetScreenState extends State<SetScreen> with SingleTickerProviderStateMixin{
  // HomeController controller = Get.find();
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isDisposed = false;
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _startAnimation();

    // _controller.repeat(reverse: true);
  }

  void _startAnimation() async {
    while (!_isDisposed) {
      await _controller.forward();
      await Future.delayed(Duration(seconds: 1));
      if (!_isDisposed) {
        _controller.reset();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String name = PreferenceUtils.getName();

    return Scaffold(

      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Device Settings',
              style: robotoMedium.copyWith(color: Colors.white, fontSize: 20),
            ),
            Text(
              '${widget.name}',
              style: robotoMedium.copyWith(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,size: 18,color: Colors.white,)),
      ),
      body: Column(
        children: [
          // Header Section
          Obx(() {
            return Container(
              color: Colors.teal,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.watch, size: 30, color: Colors.teal),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status: ${controller.connectionStatus.value}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Version: 1.0",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          // Bind Device Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              onTap: () {
                controller.startScanning();
                Get.to(ScanScreen());
              },
              child: Container(
                color: Colors.greenAccent.withOpacity(0.3),
                padding: EdgeInsets.all(12),
                // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bind devices to experience more features",
                      style: TextStyle(color: Colors.teal, fontSize: 14),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
//                String? deviceId = PreferenceUtils.getId();
//
//                     if (deviceId != null) {
//                       if (controller.connectedDevice.value == null) {
//                         showCustomSnackBar('قم باتصال الساعه اولا',);
//
//                         print("No device connected. Please connect a device first.");
//                       } else {
//                         // await controller.sendVibrationCommand();
//                         showCustomSnackBar('تم ارسال الاشعار',isError: false);
//
//                         // await controller.sendNotificationCommand();
//                         // await controller.testVibrationCommand();
//                         //  controller.testNotifications(controller.connectedDevice.value!.id);
//                       }
//
//                       // // إذا كانت القيمة ليست null
//                       // await controller.sendVibrationCommand(deviceId,);
//                       // await controller.sendCommandToDevice(deviceId, [0x01]);
//
//                     } else {
//                       showCustomSnackBar('لا تدعم خاصيه الارسال ',);
//
//                       print("No device ID found in preferences.");
//                     }
//
//                     // إرسال أمر للإشعار أو الاهتزاز
//
//                     // await controller.sendVibrationCommand(connectedDeviceId,); // "VIBRATE" هو أمر افتراضي
                InkWell(
                  onTap: () async {
                    showCustomSnackBar('تم ارسال الاشعار', isError: false);
                  },
                  borderRadius: BorderRadius.circular(12),
                  splashColor: Colors.blueAccent.withOpacity(0.2),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade600, Colors.blue.shade400],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade200,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.bell_fill,
                              size: 26,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Send Notifications',
                              style: robotoMedium.copyWith(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                // InkWell(
                //   onTap: (){
                //     Get.to(StepDetailsScreen());
                //   },
                //   borderRadius: BorderRadius.circular(10),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.white,
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         Column(
                //           children: [
                //             Text('Distance'.tr, style: robotoMedium),
                //             ClipRRect(
                //               child: Image.asset(
                //                 Images.Distance,
                //                 width: 50,
                //                 height: 50,
                //               ),
                //             ),
                //             Row(
                //               children: [
                //                 Text('${controller.distance.value}', style: robotoBold),
                //                 Text('Km', style: robotoMedium),
                //               ],
                //             ),
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Text('Consumption'.tr, style: robotoMedium),
                //             ClipRRect(
                //               child: Image.asset(
                //                 Images.Consumption,
                //                 width: 50,
                //                 height: 50,
                //               ),
                //             ),
                //             Row(
                //               children: [
                //                 Text('${controller.consumption.value}', style: robotoBold),
                //                 Text('Kcal', style: robotoMedium),
                //               ],
                //             ),
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Text('Target'.tr, style: robotoMedium),
                //             ClipRRect(
                //               child: Image.asset(
                //                 Images.Target,
                //                 width: 50,
                //                 height: 50,
                //               ),
                //             ),
                //             Row(
                //               children: [
                //                 Text('0.0', style: robotoBold),
                //                 Text('Km', style: robotoMedium),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFeatureWidget(
                        Icons.lightbulb,
                        "Raise to Wake",
                        Colors.yellow,
                            () async {
                          if (controller.connectedDevice.value != null) {
                            await controller.enableRaiseToWake(
                                controller.connectedDevice.value!.id);
                            showCustomSnackBar("تم تفعيل ميزة رفع المعصم للاستيقاظ", isError: false);
                          } else {
                            showCustomSnackBar("لم يتم الاتصال بأي جهاز", isError: true);
                          }
                        },
                      ),
                      _buildFeatureWidget(
                        Icons.notifications_off,
                        "Do Not Disturb",
                        Colors.blue,
                            () async {
                          if (controller.connectedDevice.value != null) {
                            await controller.enableDoNotDisturb(
                                controller.connectedDevice.value!.id);
                            showCustomSnackBar("تم تفعيل وضع عدم الإزعاج", isError: false);
                          } else {
                            showCustomSnackBar("لم يتم الاتصال بأي جهاز", isError: true);
                          }
                        },
                      ),
                      _buildFeatureWidget(
                        Icons.alarm,
                        "Alarms",
                        Colors.green,
                            () async {
                          if (controller.connectedDevice.value != null) {
                            await controller.setAlarms(
                                controller.connectedDevice.value!.id);
                            showCustomSnackBar("تم ضبط المنبهات بنجاح", isError: false);
                          } else {
                            showCustomSnackBar("لم يتم الاتصال بأي جهاز", isError: true);
                          }
                        },
                      ),
                      _buildFeatureWidget(
                        Icons.notifications,
                        "Reminder",
                        Colors.red,
                            () async {
                          if (controller.connectedDevice.value != null) {
                            await controller.setReminder(
                                controller.connectedDevice.value!.id);
                            showCustomSnackBar("تم ضبط التذكيرات بنجاح", isError: false);
                          } else {
                            showCustomSnackBar("لم يتم الاتصال بأي جهاز", isError: true);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),

                // InkWell(
                //   onTap: (){
                //     Get.to(HeartRateScreen());
                //   },
                //   borderRadius: BorderRadius.circular(10),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.white,
                //     ),
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.all(10),
                //           child: Row(
                //             children: [
                //               Icon(
                //                 CupertinoIcons.heart_fill,
                //                 color: Colors.red,
                //               ),
                //               AnimatedBuilder(
                //                 animation: _animation,
                //                 builder: (BuildContext context, Widget? child) {
                //                   return Transform.translate(
                //                     offset: Offset(_animation.value, 0),
                //                     child: Text(
                //                       'Heart rate',
                //                       style: robotoMedium,
                //                     ),
                //                   );
                //                 },
                //               ),
                //               SizedBox(width: 10.w),
                //               Text(
                //                 'Hightest:0 BPM    Lowest: 0 BPM',
                //                 style: robotoMedium.copyWith(color: Colors.grey),
                //               ),
                //             ],
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 20),
                //           child: Row(
                //             children: [
                //               Expanded(
                //                 child: Row(
                //                   children: [
                //                     Text('${controller.heartRate.value} ', style: robotoBold),
                //                     Text(' BPM', style: robotoMedium),
                //                   ],
                //                 ),
                //               ),
                //               Expanded(
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(16.0),
                //                   child: SizedBox(
                //                     height: 20,
                //                     child: LineChart(
                //                       LineChartData(
                //                         minX: 0,
                //                         maxX: 6,
                //                         minY: 0,
                //                         maxY: 5,
                //                         gridData: FlGridData(show: false), // إلغاء الشبكة
                //                         titlesData: FlTitlesData(
                //                           leftTitles: AxisTitles(
                //                             sideTitles: SideTitles(showTitles: false), // إلغاء العناوين على اليسار
                //                           ),
                //                           bottomTitles: AxisTitles(
                //                             sideTitles: SideTitles(showTitles: false), // إلغاء العناوين أسفل
                //                           ),
                //                           topTitles: AxisTitles(
                //                             sideTitles: SideTitles(showTitles: false),
                //                           ),
                //                           rightTitles: AxisTitles(
                //                             sideTitles: SideTitles(showTitles: false),
                //                           ),
                //                         ),
                //                         borderData: FlBorderData(show: false), // إلغاء الإطار الخارجي
                //                         lineBarsData: [
                //                           LineChartBarData(
                //                             spots: [
                //                               FlSpot(0, 2),
                //                               FlSpot(1, 2),
                //                               FlSpot(2, 2),
                //                               FlSpot(3, 2),
                //                               FlSpot(4, 2),
                //                             ],
                //                             isCurved: false, // خط مستقيم
                //                             color: Colors.blue, // لون الخط
                //                             barWidth: 2, // عرض الخط
                //                             isStrokeCapRound: true, // نهايات مستديرة للخط
                //                             belowBarData: BarAreaData(show: false), // إلغاء المنطقة تحت الخط
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),

          // Widgets Row

          SizedBox(height: 16),

          // List Items
          Expanded(
            child: ListView(
              children: [
                _buildListItem(Icons.search, "Find", Colors.blue, () {
                  controller.startScanning();
                }),
                // _buildListItem(Icons.camera_alt, "Remote photography", Colors.amber,(){}),
                // _buildListItem(Icons.send, "Message Push", Colors.green,(){}),
                _buildListItem(
                    Icons.settings_backup_restore, "Reset Device", Colors.red,
                    () {
                  controller.reconnectToDevice();
                }),
                _buildListItem(Icons.link, "Remove", Colors.orange, () async {
                  await controller.disconnectFromDevice();
                }),
                _buildListItem(Icons.more_horiz, "Other", Colors.grey, () {}),
                // _buildListItem(Icons.system_update, "OTA upgrade", Colors.teal,(){}),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
    );
  }

  Widget _buildFeatureWidget(
      IconData icon, String label, Color color, Function() onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color, size: 30),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for list items
  Widget _buildListItem(
      IconData icon, String label, Color color, Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
