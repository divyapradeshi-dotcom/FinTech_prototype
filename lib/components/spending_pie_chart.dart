import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SpendingPieChart extends StatelessWidget {
  final List<CategoryData> data;

  const SpendingPieChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PIE CHART
        SizedBox(
          height: 220,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 50,
              sections: data.map((item) {
                return PieChartSectionData(
                  value: item.value,
                  color: item.color,
                  radius: 40,
                  showTitle: false,
                );
              }).toList(),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // LEGEND
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 4,
          ),
          itemCount: data.length,
          itemBuilder: (_, index) {
            final item = data[index];
            return Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: item.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  item.name,
                  style: const TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4B5563),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class CategoryData {
  final String name;
  final double value;
  final Color color;

  CategoryData({
    required this.name,
    required this.value,
    required this.color,
  });
}