import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MicroSpendingLineChart extends StatelessWidget {
  final List<SpendingTrendPoint> data;

  const MicroSpendingLineChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 20,
            getDrawingHorizontalLine: (value) => FlLine(
              color: const Color(0xFFF0F0F0),
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),

            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 20,
                getTitlesWidget: (value, _) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ),
            ),

            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, _) {
                  final index = value.toInt();
                  if (index < 0 || index >= data.length) {
                    return const SizedBox.shrink();
                  }
                  return Text(
                    data[index].month,
                    style: const TextStyle(
                      fontFamily: 'LemonMilk',
                      fontSize: 10,
                      color: Color(0xFF9CA3AF),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            // 🔵 Subscriptions line
            LineChartBarData(
              spots: List.generate(
                data.length,
                    (i) => FlSpot(i.toDouble(), data[i].subscriptions),
              ),
              isCurved: true,
              color: const Color(0xFF0D4853), // violet
              barWidth: 2,
              dotData: FlDotData(show: true),
            ),

            // 🔴 Micro-spend line
            LineChartBarData(
              spots: List.generate(
                data.length,
                    (i) => FlSpot(i.toDouble(), data[i].microSpend),
              ),
              isCurved: true,
              color: const Color(0xFF9C9C9C), // red
              barWidth: 2,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}

class SpendingTrendPoint {
  final String month;
  final double subscriptions;
  final double microSpend;

  SpendingTrendPoint({
    required this.month,
    required this.subscriptions,
    required this.microSpend,
  });
}