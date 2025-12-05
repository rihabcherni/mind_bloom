import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  final bool isDark;

  const DividerWithText({super.key, required this.text, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: isDark ? Colors.white24 : Colors.grey[300]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
              color: isDark ? Colors.white60 : Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: isDark ? Colors.white24 : Colors.grey[300]),
        ),
      ],
    );
  }
}
