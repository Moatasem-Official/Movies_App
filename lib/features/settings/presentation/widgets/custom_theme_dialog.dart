import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomThemeDialog extends StatelessWidget {
  const CustomThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            S.of(context).selectTheme,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: Text(S.of(context).light,
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(CupertinoIcons.sun_min, color: Colors.yellow),
            onTap: () {},
          ),
          ListTile(
            title: Text(S.of(context).dark,
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(CupertinoIcons.moon, color: Colors.blue),
            onTap: () {},
          ),
        ]));
  }
}
