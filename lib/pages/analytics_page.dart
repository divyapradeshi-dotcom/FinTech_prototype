import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // MONTHLY TOTAL CARD
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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
                const Text(
                  'Monthly Total',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '\$128.92',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCFCE7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.trending_down,
                            size: 12,
                            color: Color(0xFF16A34A),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '8.2%',
                            style: TextStyle(
                              fontFamily: 'LemonMilk',
                              fontSize: 10,
                              color: Color(0xFF16A34A),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'vs last month',
                      style: TextStyle(
                        fontFamily: 'LemonMilk',
                        fontSize: 10,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // YEARLY TOTAL CARD
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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
                const Text(
                  'Yearly Total',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '\$1,547.04',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEE2E2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.trending_up,
                            size: 12,
                            color: Color(0xFFDC2626),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '12.3%',
                            style: TextStyle(
                              fontFamily: 'LemonMilk',
                              fontSize: 10,
                              color: Color(0xFFDC2626),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'vs last year',
                      style: TextStyle(
                        fontFamily: 'LemonMilk',
                        fontSize: 10,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // RISK OVERVIEW CARD
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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
                const Text(
                  'Risk Overview',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 16),

                // Risk items in a row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _RiskBadge(
                      emoji: '⚫',
                      label: '3 High',
                      color: const Color(0xFF0A5357),
                    ),
                    _RiskBadge(
                      emoji: '🔵',
                      label: '2 Medium',
                      color: const Color(0xFF1E8B98),
                    ),
                    _RiskBadge(
                      emoji: '🟢',
                      label: '3 Low',
                      color: const Color(0xFF10B981),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Progress indicator for risk levels
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    height: 8,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: const Color(0xFF0A5357),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: const Color(0xFF1E8B98),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: const Color(0xFF10B981),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Percentage breakdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      '37.5%',
                      style: TextStyle(
                        fontFamily: 'LemonMilk',
                        fontSize: 10,
                        color: Color(0xFF0A5357),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '25%',
                      style: TextStyle(
                        fontFamily: 'LemonMilk',
                        fontSize: 10,
                        color: Color(0xFF1E8B98),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '37.5%',
                      style: TextStyle(
                        fontFamily: 'LemonMilk',
                        fontSize: 10,
                        color: Color(0xFF10B981),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Note about total items
                const Center(
                  child: Text(
                    'Total 8 items at risk',
                    style: TextStyle(
                      fontFamily: 'LemonMilk',
                      fontSize: 10,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // DETECTED RECURRING PAYMENTS SECTION
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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
                const Text(
                  'Detected Recurring Payments',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '8 active subscriptions found',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 16),

                // Recurring Payment Items
                _RecurringPaymentItem(
                  serviceName: 'Netflix Premium',
                  riskLevel: 'Low Risk',
                  riskColor: const Color(0xFF10B981),
                  category: 'Entertainment',
                  monthlyAmount: '\$15.99',
                  lastCharged: 'Feb 15, 2026',
                  onReview: () {},
                  onCancel: () {},
                  onIgnore: () {},
                ),

                const Divider(height: 24, color: Color(0xFFE5E7EB)),

                _RecurringPaymentItem(
                  serviceName: 'Spotify Premium',
                  riskLevel: 'Low Risk',
                  riskColor: const Color(0xFF10B981),
                  category: 'Entertainment',
                  monthlyAmount: '\$9.99',
                  lastCharged: 'Feb 10, 2026',
                  onReview: () {},
                  onCancel: () {},
                  onIgnore: () {},
                ),

                const Divider(height: 24, color: Color(0xFFE5E7EB)),

                _RecurringPaymentItem(
                  serviceName: 'Adobe Creative Cloud',
                  riskLevel: 'Medium Risk',
                  riskColor: const Color(0xFF1E8B98),
                  category: 'Software',
                  monthlyAmount: '\$52.99',
                  lastCharged: 'Feb 5, 2026',
                  onReview: () {},
                  onCancel: () {},
                  onIgnore: () {},
                ),

                const SizedBox(height: 8),

                // View All Button
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
                          'View All Subscriptions',
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
      ),
    );
  }
}

// ======================
// RISK BADGE WIDGET
// ======================

class _RiskBadge extends StatelessWidget {
  final String emoji;
  final String label;
  final Color color;

  const _RiskBadge({
    required this.emoji,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'LemonMilk',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ======================
// RECURRING PAYMENT ITEM WIDGET
// ======================

class _RecurringPaymentItem extends StatelessWidget {
  final String serviceName;
  final String riskLevel;
  final Color riskColor;
  final String category;
  final String monthlyAmount;
  final String lastCharged;
  final VoidCallback onReview;
  final VoidCallback onCancel;
  final VoidCallback onIgnore;

  const _RecurringPaymentItem({
    required this.serviceName,
    required this.riskLevel,
    required this.riskColor,
    required this.category,
    required this.monthlyAmount,
    required this.lastCharged,
    required this.onReview,
    required this.onCancel,
    required this.onIgnore,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate yearly amount
    final monthlyValue = double.parse(monthlyAmount.replaceAll('\$', ''));
    final yearlyAmount = '\$${(monthlyValue * 12).toStringAsFixed(2)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Service name and risk level
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              serviceName,
              style: const TextStyle(
                fontFamily: 'LemonMilk',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: riskColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                riskLevel,
                style: TextStyle(
                  fontFamily: 'LemonMilk',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: riskColor,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Category and monthly amount
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                category,
                style: const TextStyle(
                  fontFamily: 'LemonMilk',
                  fontSize: 10,
                  color: Color(0xFF6B7280),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              monthlyAmount,
              style: const TextStyle(
                fontFamily: 'LemonMilk',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
            const Text(
              ' /month',
              style: TextStyle(
                fontFamily: 'LemonMilk',
                fontSize: 10,
                color: Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Last charged
        Row(
          children: [
            const Icon(
              CupertinoIcons.location_solid,
              size: 12,
              color: Color(0xFF9CA3AF),
            ),
            const SizedBox(width: 4),
            Text(
              'Last charged: $lastCharged',
              style: const TextStyle(
                fontFamily: 'LemonMilk',
                fontSize: 10,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Monthly and yearly breakdown
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.money_dollar,
                      size: 14,
                      color: Color(0xFF4FC3F7),
                    ),
                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Monthly',
                          style: TextStyle(
                            fontFamily: 'LemonMilk',
                            fontSize: 8,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                        Text(
                          monthlyAmount,
                          style: const TextStyle(
                            fontFamily: 'LemonMilk',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.calendar,
                      size: 14,
                      color: Color(0xFF4FC3F7),
                    ),
                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Yearly',
                          style: TextStyle(
                            fontFamily: 'LemonMilk',
                            fontSize: 8,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                        Text(
                          yearlyAmount,
                          style: const TextStyle(
                            fontFamily: 'LemonMilk',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Action buttons
        Row(
          children: [
            Expanded(
              child: _ActionButton(
                label: 'Review',
                onPressed: onReview,
                color: const Color(0xFF4FC3F7),
                backgroundColor: const Color(0xFFE1F5FE),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _ActionButton(
                label: 'Cancel',
                onPressed: onCancel,
                color: const Color(0xFFEF4444),
                backgroundColor: const Color(0xFFFEE2E2),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _ActionButton(
                label: 'Ignore',
                onPressed: onIgnore,
                color: const Color(0xFF6B7280),
                backgroundColor: const Color(0xFFF3F4F6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ======================
// ACTION BUTTON WIDGET
// ======================

class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color backgroundColor;

  const _ActionButton({
    required this.label,
    required this.onPressed,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'LemonMilk',
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}