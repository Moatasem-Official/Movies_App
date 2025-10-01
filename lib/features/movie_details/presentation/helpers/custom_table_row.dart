import 'package:flutter/material.dart';

TableRow buildTableRow(
  String label,
  String value,
  TextStyle labelStyle,
  TextStyle valueStyle,
) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(label, style: labelStyle),
      ),
      Text(value, style: valueStyle, textAlign: TextAlign.start),
    ],
  );
}
