import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomThemeDialog extends StatelessWidget {
  const CustomThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text(
            'Select Theme',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Light',
                style: TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(CupertinoIcons.sun_min, color: Colors.yellow),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Dark',
                style: TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(CupertinoIcons.moon, color: Colors.blue),
            onTap: () {},
          ),
        ]));
  }
}
