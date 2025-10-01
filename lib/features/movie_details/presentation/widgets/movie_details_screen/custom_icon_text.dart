import 'package:flutter/material.dart';

class CustomIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const CustomIconText({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
