import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/app/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRouter.appHomeScreen);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const darkBackgroundColor = Color.fromARGB(255, 30, 45, 53);

    return Scaffold(
      body: Container(
        color: darkBackgroundColor,
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.string(
                  '''
                  <svg width="100" height="100" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="12" cy="12" r="10" stroke="#FF5722" stroke-width="2"/>
                    <path d="M12 2V12L18 6" stroke="#FF5722" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M12 12L18 18" stroke="#FF5722" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M12 12L6 18" stroke="#FF5722" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M12 12L6 6" stroke="#FF5722" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <circle cx="12" cy="12" r="2" fill="#FF5722"/>
                  </svg>
                  ''',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 24.0),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [Color(0xFFFF5722), Color(0xFFFFCC80)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: const Text(
                    'Reel Time',
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Discover Movies & TV Shows',
                  style: TextStyle(fontSize: 16.0, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
