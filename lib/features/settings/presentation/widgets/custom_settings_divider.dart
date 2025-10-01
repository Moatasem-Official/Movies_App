import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSettingsDivider extends StatelessWidget {
  const CustomSettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.white.withOpacity(0.08),
      indent: 20,
      endIndent: 20,
    );
  }
}
