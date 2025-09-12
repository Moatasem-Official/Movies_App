import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomActorDialogRowItem extends StatelessWidget {
  const CustomActorDialogRowItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 12),
        Text(
          '$label : ',
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
