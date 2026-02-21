import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  // 🎨 Background
  final Color backgroundColor;
  final Gradient? backgroundGradient;

  // 🎨 Icon
  final Color accentColor;
  final Gradient? accentGradient;

  // 🎨 Text
  final Color titleColor;
  final Color valueColor;
  final Color subtitleColor;

  // 📐 Layout
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,

    this.backgroundColor = Colors.white,
    this.backgroundGradient, // 👈 NEW

    this.accentColor = const Color(0xFFEDE9FE),
    this.accentGradient,

    this.titleColor = const Color(0xFF6B7280),
    this.valueColor = Colors.black,
    this.subtitleColor = const Color(0xFF9CA3AF),

    this.borderRadius = 16,
    this.borderColor = const Color(0xFFE5E7EB),
    this.borderWidth = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        color: backgroundGradient == null ? backgroundColor : null,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT CONTENT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'LemonMilk',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ).copyWith(color: titleColor),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'LemonMilk',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ).copyWith(color: valueColor),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: 'LemonMilk',
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                ).copyWith(color: subtitleColor),
              ),
            ],
          ),

          // RIGHT ICON
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: accentGradient,
              color: accentGradient == null ? accentColor : null,
            ),
            child: Icon(
              icon,
              color: valueColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}