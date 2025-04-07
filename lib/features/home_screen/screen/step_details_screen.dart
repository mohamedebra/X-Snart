import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../widget/info_card.dart';
import '../widget/line_chart_widget.dart';

class StepDetailsScreen extends StatefulWidget {
  const StepDetailsScreen({super.key});

  @override
  State<StepDetailsScreen> createState() => _StepDetailsScreenState();
}

class _StepDetailsScreenState extends State<StepDetailsScreen> {
  final HomeController controller = Get.find<HomeController>();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'More Step Details',
        isActions: false,
        backgroundColor: Theme.of(context).primaryColor,
        colorTitle: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                // تحويل البيانات الديناميكية إلى FlSpot
                List<FlSpot> dynamicSpots = controller.distanceHistory.isNotEmpty
                    ? controller.distanceHistory
                    .asMap()
                    .entries
                    .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                    .toList()
                    : [
                  FlSpot(0, 1),
                  FlSpot(1, 2),
                  FlSpot(2, 1.5),
                  FlSpot(3, 2.8),
                  FlSpot(4, 3.2)
                ]; // بيانات افتراضية

                return LineChartWidget(spots: dynamicSpots);

              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() => InfoCard(
                    icon: Icons.directions_walk,
                    label: 'Total Steps',
                    value: '${controller.heartRate.value} Step',
                    color: Colors.yellow,
                  )),
                  Obx(() => InfoCard(
                    icon: Icons.location_on,
                    label: 'Distances',
                    value: '${controller.distance.value.toStringAsFixed(2)} km',
                    color: Colors.blue,
                  )),
                  Obx(() => InfoCard(
                    icon: Icons.local_fire_department,
                    label: 'Calories',
                    value: '${(controller.distance.value * 50).toStringAsFixed(2)} kcal',
                    color: Colors.red,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   items: [
      //     _buildBottomNavigationBarItem('Day', 0),
      //     _buildBottomNavigationBarItem('Week', 1),
      //     _buildBottomNavigationBarItem('Month', 2),
      //   ],
      //   type: BottomNavigationBarType.fixed,
      // ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _currentIndex == index ? Colors.teal : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          color: _currentIndex == index ? Colors.teal.withOpacity(0.1) : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          label,
          style: TextStyle(
            color: _currentIndex == index ? Colors.teal : Colors.grey,
            fontWeight: _currentIndex == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
      label: '',
    );
  }
}

