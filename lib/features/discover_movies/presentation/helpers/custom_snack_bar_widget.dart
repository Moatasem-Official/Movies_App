import 'package:flutter/material.dart';

SnackBar customSnackBar(
        {required String message,
        int duration = 1,
        IconData icon = Icons.check}) =>
    SnackBar(
      backgroundColor: const Color(0xFF2c5364),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      dismissDirection: DismissDirection.down,
      elevation: 2,
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(message, style: const TextStyle(color: Colors.white)),
        ],
      ),
      duration: Duration(seconds: duration),
    );
