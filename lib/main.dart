import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/app/service_locator.dart';
import 'package:movies_app/app/app_router.dart';

void main() {
  setupMoviesInjection();
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
