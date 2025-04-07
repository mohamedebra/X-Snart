import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<FlSpot> spots;

  const LineChartWidget({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    value.toStringAsFixed(1),
                    style: TextStyle(fontSize: 10),
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 2,
              getTitlesWidget: (value, meta) {
                return value % 2 == 0
                    ? Transform.rotate(
                  angle: -0.4,
                  child: Text(
                    value.toInt().toString().padLeft(2, '0'),
                    style: TextStyle(fontSize: 10),
                  ),
                )
                    : Container(); // إخفاء القيم الفردية
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: spots, // استخدام النقاط الديناميكية
            isCurved: true,
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.green],
            ),
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Colors.teal.withOpacity(0.3),
                  Colors.green.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}