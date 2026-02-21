import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Total Savings Potential Card
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
                  'Total Savings Potential',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '\$1,169.64',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0D444A),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Per year if all recommendations are followed',
                  style: TextStyle(
                    fontFamily: 'LemonMilk',
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Stats Row
          Column(
            children: [
              _StatsCard(
                count: '4',
                label: 'Actionable items',
                icon: CupertinoIcons.exclamationmark_triangle,
                color: const Color(0xFFF59E0B),
                backgroundColor: const Color(0xFFFEF3C7),
              ),
              const SizedBox(height: 12),
              _StatsCard(
                count: '3',
                label: 'Savings opportunities',
                icon: CupertinoIcons.money_dollar,
                color: const Color(0xFF10B981),
                backgroundColor: const Color(0xFFECFDF5),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Quick Actions Header
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontFamily: 'LemonMilk',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 12),

          // Review all high-risk items action
          _QuickActionTile(
            title: 'Review all high-risk items',
            subtitle: '3 subscriptions need attention',
            icon: CupertinoIcons.exclamationmark_triangle,
            iconColor: const Color(0xFFEF4444),
            backgroundColor: const Color(0xFFFEE2E2),
            onTap: () {},
          ),

          const SizedBox(height: 8),

          // Set spending limits action
          _QuickActionTile(
            title: 'Set spending limits',
            subtitle: 'Control micro-spending patterns',
            icon: CupertinoIcons.speedometer,
            iconColor: const Color(0xFF4FC3F7),
            backgroundColor: const Color(0xFFE1F5FE),
            onTap: () {},
          ),

          const SizedBox(height: 24),

          // Additional Settings Sections
          const Text(
            'Preferences',
            style: TextStyle(
              fontFamily: 'LemonMilk',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 12),

          // Notification Settings
          _SettingsTile(
            title: 'Notifications',
            subtitle: 'Manage alert preferences',
            icon: CupertinoIcons.bell,
            onTap: () {},
          ),

          _SettingsTile(
            title: 'Currency',
            subtitle: 'USD - US Dollar',
            icon: CupertinoIcons.money_dollar,
            onTap: () {},
          ),

          _SettingsTile(
            title: 'Budget Period',
            subtitle: 'Monthly',
            icon: CupertinoIcons.calendar,
            onTap: () {},
          ),

          const SizedBox(height: 16),

          // Account Section
          const Text(
            'Account',
            style: TextStyle(
              fontFamily: 'LemonMilk',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 12),

          _SettingsTile(
            title: 'Profile Information',
            subtitle: 'Update your details',
            icon: CupertinoIcons.person,
            onTap: () {},
          ),

          _SettingsTile(
            title: 'Connected Accounts',
            subtitle: 'Bank connections',
            icon: CupertinoIcons.link,
            onTap: () {},
          ),

          _SettingsTile(
            title: 'Export Data',
            subtitle: 'Download your reports',
            icon: CupertinoIcons.cloud_download,
            onTap: () {},
          ),

          const SizedBox(height: 16),

          // Support Section
          const Text(
            'Support',
            style: TextStyle(
              fontFamily: 'LemonMilk',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 12),

          _SettingsTile(
            title: 'Help Center',
            subtitle: 'FAQs and guides',
            icon: CupertinoIcons.question_circle,
            onTap: () {},
          ),

          _SettingsTile(
            title: 'Contact Us',
            subtitle: 'Get in touch',
            icon: CupertinoIcons.mail,
            onTap: () {},
          ),

          _SettingsTile(
            title: 'Privacy Policy',
            subtitle: 'Read our policy',
            icon: CupertinoIcons.lock,
            onTap: () {},
          ),

          const SizedBox(height: 20),

          // Version Info
          const Center(
            child: Text(
              'Version 1.0.0',
              style: TextStyle(
                fontFamily: 'LemonMilk',
                fontSize: 10,
                color: Color(0xFF9CA3AF),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ======================
// STATS CARD WIDGET
// ======================

class _StatsCard extends StatelessWidget {
  final String count;
  final String label;
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  const _StatsCard({
    required this.count,
    required this.label,
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count,
                style: TextStyle(
                  fontFamily: 'LemonMilk',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'LemonMilk',
                  fontSize: 10,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ======================
// QUICK ACTION TILE WIDGET
// ======================

class _QuickActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _QuickActionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'LemonMilk',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'LemonMilk',
                      fontSize: 11,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              size: 18,
              color: Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================
// SETTINGS TILE WIDGET
// ======================

class _SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 18,
                color: const Color(0xFF4FC3F7),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'LemonMilk',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'LemonMilk',
                      fontSize: 11,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              size: 16,
              color: Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }
}