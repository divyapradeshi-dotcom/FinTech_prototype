import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Total Amount and Stats
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
                  'Total Amount',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '\$39.49',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  '12 transactions',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),

                const SizedBox(height: 16),

                // Recurring stats row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.repeat,
                            size: 14,
                            color: Color(0xFF4FC3F7),
                          ),
                          const SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Recurring',
                                style: TextStyle(
                                  fontFamily: 'LemonMilk',
                                  fontSize: 10,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                              Text(
                                '10',
                                style: const TextStyle(
                                  fontFamily: 'LemonMilk',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF111827),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEE2E2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.exclamationmark_triangle,
                            size: 14,
                            color: Color(0xFF610000),
                          ),
                          const SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'High Risk',
                                style: TextStyle(
                                  fontFamily: 'LemonMilk',
                                  fontSize: 10,
                                  color: Color(0xFF6C0000),
                                ),
                              ),
                              Text(
                                '4',
                                style: const TextStyle(
                                  fontFamily: 'LemonMilk',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF4A0000),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _FilterChip(
                  label: 'All',
                  isSelected: true,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: 'Recurring Only',
                  isSelected: false,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: 'High Risk',
                  isSelected: false,
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Today Section (3 transactions)
          const _DateHeader(date: 'Today'),
          const SizedBox(height: 12),

          // Coffee Shop Transaction
          _TransactionItem(
            merchant: 'Coffee Shop Downtown',
            icon: '☕',
            amount: '\$4.50',
            category: 'Food & Drink',
            leakageProbability: 35,
            riskLevel: 'Low',
            riskColor: const Color(0xFF10B981),
            showWarning: false,
          ),

          const SizedBox(height: 12),

          // Gym Membership
          _TransactionItem(
            merchant: 'Fitness Plus Gym',
            icon: '💪',
            amount: '\$45.00',
            category: 'Health & Fitness',
            leakageProbability: 15,
            riskLevel: 'Low',
            riskColor: const Color(0xFF10B981),
            showWarning: false,
          ),

          const SizedBox(height: 12),

          // Fast Food
          _TransactionItem(
            merchant: 'Burger King',
            icon: '🍔',
            amount: '\$12.75',
            category: 'Food & Drink',
            leakageProbability: 25,
            riskLevel: 'Low',
            riskColor: const Color(0xFF10B981),
            showWarning: false,
          ),

          const SizedBox(height: 20),

          // Yesterday Section (3 transactions)
          const _DateHeader(date: 'Yesterday'),
          const SizedBox(height: 12),

          // App Store Transaction
          _TransactionItem(
            merchant: 'App Store - Coin Pack',
            icon: '📱',
            amount: '\$2.99',
            category: 'In-App Purchase',
            leakageProbability: 78,
            riskLevel: 'High',
            riskColor: const Color(0xFFEF4444),
            showWarning: true,
            warningMessage: 'Recurring micro-payment detected. This may be contributing to spending leakage.',
          ),

          const SizedBox(height: 12),

          // Amazon Purchase
          _TransactionItem(
            merchant: 'Amazon',
            icon: '📦',
            amount: '\$34.99',
            category: 'Shopping',
            leakageProbability: 45,
            riskLevel: 'Medium',
            riskColor: const Color(0xFFF59E0B),
            showWarning: false,
          ),

          const SizedBox(height: 12),

          // Uber Ride
          _TransactionItem(
            merchant: 'Uber',
            icon: '🚗',
            amount: '\$18.50',
            category: 'Transportation',
            leakageProbability: 52,
            riskLevel: 'Medium',
            riskColor: const Color(0xFFF59E0B),
            showWarning: false,
          ),

          const SizedBox(height: 20),

          // Wed, Feb 18 Section (3 transactions)
          const _DateHeader(date: 'Wed, Feb 18'),
          const SizedBox(height: 12),

          // Parking Meter Transaction
          _TransactionItem(
            merchant: 'Parking Meter',
            icon: '🅿️',
            amount: '\$1.50',
            category: 'Transportation',
            leakageProbability: 42,
            riskLevel: 'Medium',
            riskColor: const Color(0xFFF59E0B),
            showWarning: false,
          ),

          const SizedBox(height: 12),

          // Netflix Subscription
          _TransactionItem(
            merchant: 'Netflix',
            icon: '🎬',
            amount: '\$15.99',
            category: 'Entertainment',
            leakageProbability: 65,
            riskLevel: 'Medium',
            riskColor: const Color(0xFFF59E0B),
            showWarning: true,
            warningMessage: 'Recurring subscription. Consider reviewing your plan.',
          ),

          const SizedBox(height: 12),

          // Grocery Store
          _TransactionItem(
            merchant: 'Whole Foods',
            icon: '🛒',
            amount: '\$67.23',
            category: 'Groceries',
            leakageProbability: 22,
            riskLevel: 'Low',
            riskColor: const Color(0xFF10B981),
            showWarning: false,
          ),

          const SizedBox(height: 20),

          // Tue, Feb 17 Section (2 transactions - min 1, max 3)
          const _DateHeader(date: 'Tue, Feb 17'),
          const SizedBox(height: 12),

          // Gas Station
          _TransactionItem(
            merchant: 'Shell Gas Station',
            icon: '⛽',
            amount: '\$42.50',
            category: 'Transportation',
            leakageProbability: 18,
            riskLevel: 'Low',
            riskColor: const Color(0xFF10B981),
            showWarning: false,
          ),

          const SizedBox(height: 12),

          // Spotify Subscription
          _TransactionItem(
            merchant: 'Spotify',
            icon: '🎵',
            amount: '\$9.99',
            category: 'Entertainment',
            leakageProbability: 58,
            riskLevel: 'Medium',
            riskColor: const Color(0xFFF59E0B),
            showWarning: true,
            warningMessage: 'Recurring subscription. Annual plan could save \$20.',
          ),

          const SizedBox(height: 20),

          // Mon, Feb 16 Section (1 transaction - min 1)
          const _DateHeader(date: 'Mon, Feb 16'),
          const SizedBox(height: 12),

          // Pharmacy
          _TransactionItem(
            merchant: 'CVS Pharmacy',
            icon: '💊',
            amount: '\$12.99',
            category: 'Health',
            leakageProbability: 12,
            riskLevel: 'Low',
            riskColor: const Color(0xFF10B981),
            showWarning: false,
          ),

          const SizedBox(height: 20),

          // Sun, Feb 15 Section (3 transactions)
          const _DateHeader(date: 'Sun, Feb 15'),
          const SizedBox(height: 12),

          // Brunch
          _TransactionItem(
            merchant: 'Sunday Brunch Cafe',
            icon: '🥞',
            amount: '\$28.50',
            category: 'Food & Drink',
            leakageProbability: 28,
            riskLevel: 'Low',
            riskColor: const Color(0xFF10B981),
            showWarning: false,
          ),

          const SizedBox(height: 12),

          // Movie Theater
          _TransactionItem(
            merchant: 'AMC Theaters',
            icon: '🎥',
            amount: '\$24.00',
            category: 'Entertainment',
            leakageProbability: 32,
            riskLevel: 'Low',
            riskColor: const Color(0xFF10B981),
            showWarning: false,
          ),

          const SizedBox(height: 12),

          // Online Course
          _TransactionItem(
            merchant: 'Udemy Course',
            icon: '📚',
            amount: '\$14.99',
            category: 'Education',
            leakageProbability: 48,
            riskLevel: 'Medium',
            riskColor: const Color(0xFFF59E0B),
            showWarning: false,
          ),
        ],
      ),
    );
  }
}

// ======================
// FILTER CHIP WIDGET
// ======================

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4FC3F7) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF4FC3F7) : const Color(0xFFE5E7EB),
          ),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'LemonMilk',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}

// ======================
// DATE HEADER WIDGET
// ======================

class _DateHeader extends StatelessWidget {
  final String date;

  const _DateHeader({
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        date,
        style: const TextStyle(
          fontFamily: 'LemonMilk',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFF111827),
        ),
      ),
    );
  }
}

// ======================
// TRANSACTION ITEM WIDGET
// ======================

class _TransactionItem extends StatelessWidget {
  final String merchant;
  final String icon;
  final String amount;
  final String category;
  final int leakageProbability;
  final String riskLevel;
  final Color riskColor;
  final bool showWarning;
  final String? warningMessage;

  const _TransactionItem({
    required this.merchant,
    required this.icon,
    required this.amount,
    required this.category,
    required this.leakageProbability,
    required this.riskLevel,
    required this.riskColor,
    this.showWarning = false,
    this.warningMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main transaction row
          Row(
            children: [
              // Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    icon,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Merchant and category
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      merchant,
                      style: const TextStyle(
                        fontFamily: 'LemonMilk',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      category,
                      style: const TextStyle(
                        fontFamily: 'LemonMilk',
                        fontSize: 10,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),

              // Amount
              Text(
                amount,
                style: const TextStyle(
                  fontFamily: 'LemonMilk',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Leakage probability and risk level
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Leakage probability
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: leakageProbability / 100,
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getProbabilityColor(leakageProbability),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Leakage probability: $leakageProbability%',
                    style: const TextStyle(
                      fontFamily: 'LemonMilk',
                      fontSize: 10,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),

              // Risk level badge
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

          // Warning message (if any)
          if (showWarning) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF3C7),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFF59E0B).withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.exclamationmark_triangle,
                    size: 14,
                    color: Color(0xFFF59E0B),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      warningMessage!,
                      style: const TextStyle(
                        fontFamily: 'LemonMilk',
                        fontSize: 10,
                        color: Color(0xFF92400E),
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getProbabilityColor(int probability) {
    if (probability >= 70) {
      return const Color(0xFFEF4444); // Red for high
    } else if (probability >= 40) {
      return const Color(0xFFF59E0B); // Orange for medium
    } else {
      return const Color(0xFF10B981); // Green for low
    }
  }
}