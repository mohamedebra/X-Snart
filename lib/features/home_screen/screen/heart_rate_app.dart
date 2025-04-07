import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_watch/core/widget/custom_app_bar.dart';
import 'package:smart_watch/core/widget/custom_snackbar.dart';

import '../../../controller/home_controller.dart';
import '../widget/circular_progress_painter.dart';

class HeartRateScreen extends StatelessWidget {
  const HeartRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Heart',
        isActions: false,
        backgroundColor: Theme.of(context).primaryColor,
        colorTitle: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      painter: CircularProgressPainter(),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            ),
                            Obx(() => Text(
                              '${controller.heartRate.value}',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            )),
                            Text(
                              'unit: BPM',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Spo2',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Obx(() => Text(
                              '${controller.spo2.value}%',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            )),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Blood',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Obx(() => Text(
                              controller.bloodPressure.value,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (controller.connectedDevice.value?.id != null) {
                  controller.subscribeToHeartRate(controller.connectedDevice.value!.id);
                } else {
                  showCustomSnackBar('قم بالاتصال بالساعه اولا');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'START MEASURING',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
