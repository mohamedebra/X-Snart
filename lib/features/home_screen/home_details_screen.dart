import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_watch/core/constants/images.dart';
import 'package:smart_watch/core/widget/custom_image_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smart_watch/core/widget/custom_snackbar.dart';
import 'package:smart_watch/features/home_screen/screen/heart_rate_app.dart';
import 'package:smart_watch/features/home_screen/screen/step_details_screen.dart';
import 'package:smart_watch/features/home_screen/widget/smart_widget.dart';
import 'package:smart_watch/features/home_screen/widget/steps_painter.dart';

import '../../controller/home_controller.dart';
import '../../core/PreferenceUtils.dart';
import '../../core/animation.dart';
import '../../core/constants/styles.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../core/model/list_model.dart';
import '../set_screen/set_screen.dart';

class HomeDetailsScreen extends StatefulWidget {
  const HomeDetailsScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen>
    with SingleTickerProviderStateMixin {
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

  List<ListModel> listSmart = [
    ListModel('Mohamed', 'First grade'),
    ListModel('Ahmed', 'Second grade'),
    ListModel('Mahmoud', 'Third grade'),
    ListModel('Mariam', 'Fifth grade'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(25),
            //       bottomRight: Radius.circular(25),
            //     ),
            //     color:  Colors.teal,
            //   ),
            //   height: 170.h,
            //   width: double.infinity,
            //   child:  Center(
            //     child: CustomPaint(
            //       painter: StepsPainter(),
            //       child: SizedBox(
            //         width: 170.w,
            //         height: 200.h,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               'Steps',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             SizedBox(height: 8),
            //             Text(
            //               '0',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 40,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             SizedBox(height: 8),
            //             Text(
            //               'Target:5000',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 16,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: Colors.teal,
              ),
              height: 90.h,
              width: double.infinity,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    CircleAvatar(
                      radius: 25.r,
                      backgroundImage: AssetImage(Images.logo),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Text('Yalla Go',style: robotoMedium.copyWith(
                            color: Colors.white,
                          fontSize: 15
                        ),),
                        Text('version: 1.0',style: robotoMedium.copyWith(
                            color: Colors.white,
                            fontSize: 11
                        ),),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(widget.title,style:  robotoMedium.copyWith(
                          color: Colors.white,
                          fontSize: 17
                      ),),
                    )
                  ],
                ),
              ),),

            // Obx(() {
            //                         return Column(
            //                           children: [
            //                             Row(
            //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                               children: [
            //                                 Column(
            //                                   children: [
            //                                     Text('Distance', style: robotoMedium),
            //                                     Text('${controller.distance.value} Km', style: robotoBold),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     Text('Consumption', style: robotoMedium),
            //                                     Text('${controller.consumption.value} Kcal', style: robotoBold),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     Text('Heart Rate', style: robotoMedium),
            //                                     Text('${controller.heartRate.value} BPM', style: robotoBold),
            //                                   ],
            //                                 ),
            //                               ],
            //                             ),
            //                           ],
            //                         );
            //                       }),

            //   // child: Center(
            //   //   child: Obx(() {
            //   //     return Column(
            //   //       mainAxisAlignment: MainAxisAlignment.center,
            //   //       children: [
            //   //         Text(
            //   //           'Steps',
            //   //           style: TextStyle(
            //   //             color: Colors.white,
            //   //             fontSize: 18,
            //   //             fontWeight: FontWeight.bold,
            //   //           ),
            //   //         ),
            //   //         SizedBox(height: 8),
            //   //         Text(
            //   //           '${controller.distance.value}',
            //   //           style: TextStyle(
            //   //             color: Colors.white,
            //   //             fontSize: 40,
            //   //             fontWeight: FontWeight.bold,
            //   //           ),
            //   //         ),
            //   //         SizedBox(height: 8),
            //   //         Text(
            //   //           'Target: 5000',
            //   //           style: TextStyle(
            //   //             color: Colors.white,
            //   //             fontSize: 16,
            //   //           ),
            //   //         ),
            //   //       ],
            //   //     );
            //   //   }),
            //   // ),
            // ),

            SizedBox(height: 15.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 200.h,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text('${value.toInt()}K',style: robotoMedium.copyWith(color: Colors.black54),);

                          },
                          reservedSize: 40,
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minY: 10,
                    maxY: 25,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 15),
                          FlSpot(1, 18),
                          FlSpot(2, 20),
                          FlSpot(3, 18.5),
                          FlSpot(4, 22),
                          FlSpot(5, 18),
                        ],
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [Colors.green, Colors.greenAccent],
                        ),
                        barWidth: 3,
                        belowBarData: BarAreaData(show: false),
                      ),
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 12),
                          FlSpot(1, 13),
                          FlSpot(2, 14),
                          FlSpot(3, 13),
                          FlSpot(4, 14),
                          FlSpot(5, 12),
                        ],
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.blueAccent],
                        ),
                        barWidth: 3,
                        belowBarData: BarAreaData(show: false),
                      ),
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 10),
                          FlSpot(1, 12),
                          FlSpot(2, 15),
                          FlSpot(3, 19),
                          FlSpot(4, 22),
                          FlSpot(5, 25),
                        ],
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.orangeAccent],
                        ),
                        barWidth: 3,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
            //   child: Column(
            //     children: [
            //
            //       InkWell(
            //         onTap: ()async{
            //           String? deviceId = PreferenceUtils.getId();
            //
            //           if (deviceId != null) {
            //             if (controller.connectedDevice.value == null) {
            //               showCustomSnackBar('قم باتصال الساعه اولا',);
            //
            //               print("No device connected. Please connect a device first.");
            //             } else {
            //               await controller.sendVibrationCommand();
            //               showCustomSnackBar('تم ارسال الاشعار',isError: false);
            //
            //               // await controller.sendNotificationCommand();
            //               // await controller.testVibrationCommand();
            //               //  controller.testNotifications(controller.connectedDevice.value!.id);
            //             }
            //
            //             // // إذا كانت القيمة ليست null
            //             // await controller.sendVibrationCommand(deviceId,);
            //             // await controller.sendCommandToDevice(deviceId, [0x01]);
            //
            //           } else {
            //             showCustomSnackBar('لا تدعم خاصيه الارسال ',);
            //
            //             print("No device ID found in preferences.");
            //           }
            //
            //           // إرسال أمر للإشعار أو الاهتزاز
            //
            //           // await controller.sendVibrationCommand(connectedDeviceId,); // "VIBRATE" هو أمر افتراضي
            //         },
            //         borderRadius: BorderRadius.circular(10),
            //
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.white,
            //           ),
            //           child: Center(
            //             child: Padding(
            //               padding: const EdgeInsets.all(15.0),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text('Send Notifications',style: robotoMedium,),
            //                   Icon(CupertinoIcons.bell)
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 10.h),
            //
            //       InkWell(
            //         onTap: (){
            //           Get.to(StepDetailsScreen());
            //         },
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.white,
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Column(
            //                 children: [
            //                   Text('Distance'.tr, style: robotoMedium),
            //                   ClipRRect(
            //                     child: Image.asset(
            //                       Images.Distance,
            //                       width: 50,
            //                       height: 50,
            //                     ),
            //                   ),
            //                   Row(
            //                     children: [
            //                       Text('${controller.distance.value}', style: robotoBold),
            //                       Text('Km', style: robotoMedium),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               Column(
            //                 children: [
            //                   Text('Consumption'.tr, style: robotoMedium),
            //                   ClipRRect(
            //                     child: Image.asset(
            //                       Images.Consumption,
            //                       width: 50,
            //                       height: 50,
            //                     ),
            //                   ),
            //                   Row(
            //                     children: [
            //                       Text('${controller.consumption.value}', style: robotoBold),
            //                       Text('Kcal', style: robotoMedium),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               Column(
            //                 children: [
            //                   Text('Target'.tr, style: robotoMedium),
            //                   ClipRRect(
            //                     child: Image.asset(
            //                       Images.Target,
            //                       width: 50,
            //                       height: 50,
            //                     ),
            //                   ),
            //                   Row(
            //                     children: [
            //                       Text('0.0', style: robotoBold),
            //                       Text('Km', style: robotoMedium),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 10.h),
            //       InkWell(
            //         onTap: (){
            //           Get.to(HeartRateScreen());
            //         },
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.white,
            //           ),
            //           child: Column(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.all(10),
            //                 child: Row(
            //                   children: [
            //                     Icon(
            //                       CupertinoIcons.heart_fill,
            //                       color: Colors.red,
            //                     ),
            //                     AnimatedBuilder(
            //                       animation: _animation,
            //                       builder: (BuildContext context, Widget? child) {
            //                         return Transform.translate(
            //                           offset: Offset(_animation.value, 0),
            //                           child: Text(
            //                             'Heart rate',
            //                             style: robotoMedium,
            //                           ),
            //                         );
            //                       },
            //                     ),
            //                     SizedBox(width: 10.w),
            //                     Text(
            //                       'Hightest:0 BPM    Lowest: 0 BPM',
            //                       style: robotoMedium.copyWith(color: Colors.grey),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(horizontal: 20),
            //                 child: Row(
            //                   children: [
            //                     Expanded(
            //                       child: Row(
            //                         children: [
            //                           Text('${controller.heartRate.value} ', style: robotoBold),
            //                           Text(' BPM', style: robotoMedium),
            //                         ],
            //                       ),
            //                     ),
            //                     Expanded(
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(16.0),
            //                         child: SizedBox(
            //                           height: 20,
            //                           child: LineChart(
            //                             LineChartData(
            //                               minX: 0,
            //                               maxX: 6,
            //                               minY: 0,
            //                               maxY: 5,
            //                               gridData: FlGridData(show: false), // إلغاء الشبكة
            //                               titlesData: FlTitlesData(
            //                                 leftTitles: AxisTitles(
            //                                   sideTitles: SideTitles(showTitles: false), // إلغاء العناوين على اليسار
            //                                 ),
            //                                 bottomTitles: AxisTitles(
            //                                   sideTitles: SideTitles(showTitles: false), // إلغاء العناوين أسفل
            //                                 ),
            //                                 topTitles: AxisTitles(
            //                                   sideTitles: SideTitles(showTitles: false),
            //                                 ),
            //                                 rightTitles: AxisTitles(
            //                                   sideTitles: SideTitles(showTitles: false),
            //                                 ),
            //                               ),
            //                               borderData: FlBorderData(show: false), // إلغاء الإطار الخارجي
            //                               lineBarsData: [
            //                                 LineChartBarData(
            //                                   spots: [
            //                                     FlSpot(0, 2),
            //                                     FlSpot(1, 2),
            //                                     FlSpot(2, 2),
            //                                     FlSpot(3, 2),
            //                                     FlSpot(4, 2),
            //                                   ],
            //                                   isCurved: false, // خط مستقيم
            //                                   color: Colors.blue, // لون الخط
            //                                   barWidth: 2, // عرض الخط
            //                                   isStrokeCapRound: true, // نهايات مستديرة للخط
            //                                   belowBarData: BarAreaData(show: false), // إلغاء المنطقة تحت الخط
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .26,
              child: LiveList.options(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return MdAnimation(
                    animation: animation,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),

                        onTap: (){
                          Get.to(SetScreen(name: listSmart[index].name!,));
                        },
                        child: Container(
                          // margin: EdgeInsets.symmetric(horizontal: 10),
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: Image(
                                  image: AssetImage(Images.smartWatch),
                                  width: 120.h,
                                ),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listSmart[index].name!,style:  robotoMedium.copyWith(fontSize: 15),),
                                    Text(listSmart[index].dec!,style:  robotoMedium,)

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: listSmart.length,
                options: options,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Stack(
                    children: [
                      PieChart(
                        PieChartData(
                          sections: showingSections(),
                          centerSpaceRadius: 50,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total",
                              style: robotoMedium.copyWith(color: Colors.grey.shade500),
                            ),
                            Text(
                                "45,251",
                                style: robotoBold.copyWith(fontSize: 16.sp)
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Indicator(color: Colors.blue, text: 'Excellent'),
                    SizedBox(height: 10),
                    Indicator(color: Colors.orange, text: 'Good'),
                    SizedBox(height: 10),
                    Indicator(color: Colors.green, text: 'Poor'),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: 50,
        title: '',
        radius: 15,
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 30,
        title: '',
        radius: 15,

      ),
      PieChartSectionData(
        color: Colors.green,
        value: 20,
        title: '',
        radius: 15,
      ),
    ];
  }

}



class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
