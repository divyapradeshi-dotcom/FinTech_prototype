import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../components/stat_card.dart';
import '../components/spending_pie_chart.dart';
import '../components/micro_spending_line_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ======================
    // DATA
    // ======================

    final List<CategoryData> categoryBreakdown = [
      CategoryData(
        name: 'Subscriptions',
        value: 45,
        color: const Color(0xFF1E3A8A), // Darkest blue
      ),
      CategoryData(
        name: 'Food',
        value: 30,
        color: const Color(0xFF2563EB), // Medium-dark blue
      ),
      CategoryData(
        name: 'Shopping',
        value: 15,
        color: const Color(0xFF3B82F6), // Medium blue
      ),
      CategoryData(
        name: 'Other',
        value: 10,
        color: const Color(0xFF60A5FA), // Light blue
      ),
    ];

    final List<Map<String, dynamic>> statData = [
      {
        'title': 'Total Spend',
        'value': '\$228.91',
        'subtitle': 'This month',
        'icon': CupertinoIcons.money_dollar,
        'accentGradient': const LinearGradient(
          colors: [Color(0xFFA78BFA), Color(0xFF7C3AED)],
        ),
        'valueColor': const Color(0xFF4C1D95),
      },
      {
        'title': 'Recurring Charges',
        'value': '\$138.00',
        'subtitle': 'This month',
        'icon': CupertinoIcons.repeat,
        'accentGradient': const LinearGradient(
          colors: [Color(0xFF6EE7B7), Color(0xFF10B981)],
        ),
        'valueColor': const Color(0xFF065F46),
      },
      {
        'title': 'Potential Leakage',
        'value': '\$69.45',
        'subtitle': '3 high risk items',
        'icon': CupertinoIcons.exclamationmark_triangle,
        'accentGradient': const LinearGradient(
          colors: [Color(0xFFFCA5A5), Color(0xFFEF4444)],
        ),
        'valueColor': const Color(0xFF991B1B),
      },
      {
        'title': 'Saving Opportunity',
        'value': '\$359.45',
        'subtitle': 'Yearly Potential',
        'icon': CupertinoIcons.add_circled,
        'backgroundGradient': const LinearGradient(
          colors: [Color(0xFFECFDF5), Color(0xFFD1FAE5)],
        ),
        'accentGradient': const LinearGradient(
          colors: [Color(0xFF6EE7B7), Color(0xFF10B981)],
        ),
        'titleColor': const Color(0xFF065F46),
        'valueColor': const Color(0xFF064E3B),
        'subtitleColor': const Color(0xFF047857),
      },
    ];

    final List<SpendingTrendPoint> spendingTrendData = [
      SpendingTrendPoint(month: 'Jan', subscriptions: 120, microSpend: 80),
      SpendingTrendPoint(month: 'Feb', subscriptions: 135, microSpend: 95),
      SpendingTrendPoint(month: 'Mar', subscriptions: 150, microSpend: 110),
      SpendingTrendPoint(month: 'Apr', subscriptions: 160, microSpend: 90),
      SpendingTrendPoint(month: 'May', subscriptions: 170, microSpend: 70),
    ];

    // ======================
    // UI
    // ======================

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // KPI CARDS
        ...List.generate(statData.length, (index) {
          final item = statData[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: StatCard(
              title: item['title'],
              value: item['value'],
              subtitle: item['subtitle'],
              icon: item['icon'],
              backgroundGradient: item['backgroundGradient'],
              accentGradient: item['accentGradient'],
              accentColor:
              item['accentColor'] ?? const Color(0xFFEDE9FE),
              titleColor:
              item['titleColor'] ?? const Color(0xFF6B7280),
              valueColor: item['valueColor'] ?? Colors.black,
              subtitleColor:
              item['subtitleColor'] ?? const Color(0xFF9CA3AF),
            ),
          );
        }),

        const SizedBox(height: 6),

        // SPENDING BY CATEGORY
        _SectionCard(
          title: 'Spending by Category',
          child: SpendingPieChart(data: categoryBreakdown),
        ),

        const SizedBox(height: 16),

        // MICRO-SPENDING ANALYTICS
        _SectionCard(
          title: 'Micro-Spending Risk Analytics',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '\$89.12',
                        style: TextStyle(
                          fontFamily: 'LemonMilk',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'This month',
                        style: TextStyle(
                          fontFamily: 'LemonMilk',
                          fontSize: 10,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.trending_down,
                            size: 14, color: Color(0xFF16A34A)),
                        SizedBox(width: 4),
                        Text(
                          '20.7%',
                          style: TextStyle(
                            fontFamily: 'LemonMilk',
                            fontSize: 11,
                            color: Color(0xFF16A34A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              MicroSpendingLineChart(data: spendingTrendData),

              const SizedBox(height: 12),

              const Row(
                children: [
                  _LegendDot(
                      color: Color(0xFF8B5CF6),
                      label: 'Subscriptions'),
                  SizedBox(width: 16),
                  _LegendDot(
                      color: Color(0xFFEF4444),
                      label: 'Micro-Spend'),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // SMART INSIGHTS SECTION
        _SectionCard(
          title: 'Smart Insights',
          child: Column(
            children: [
              _InsightTile(
                message: 'You\'ve saved \$23.45 by pausing unused subscriptions',
                icon: CupertinoIcons.checkmark_alt_circle,
                iconColor: const Color(0xFF10B981),
                backgroundColor: const Color(0xFFECFDF5),
              ),
              const SizedBox(height: 12),
              _InsightTile(
                message: '3 subscriptions are up for renewal next week',
                icon: CupertinoIcons.alarm,
                iconColor: const Color(0xFFF59E0B),
                backgroundColor: const Color(0xFFFEF3C7),
              ),
              const SizedBox(height: 12),
              _InsightTile(
                message: 'Consider switching to annual plan for Spotify',
                icon: CupertinoIcons.lightbulb,
                iconColor: const Color(0xFF4FC3F7),
                backgroundColor: const Color(0xFFE1F5FE),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF4FC3F7),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View All Insights',
                        style: TextStyle(
                          fontFamily: 'LemonMilk',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(CupertinoIcons.chevron_right, size: 14),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ======================
// REUSABLE SECTION CARD
// ======================

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'LemonMilk',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

// ======================
// LEGEND DOT
// ======================

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'LemonMilk',
            fontSize: 10,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}

// ======================
// INSIGHT TILE WIDGET
// ======================

class _InsightTile extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const _InsightTile({
    required this.message,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontFamily: 'LemonMilk',
                fontSize: 12,
                color: Color(0xFF374151),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}