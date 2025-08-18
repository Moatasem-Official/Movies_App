import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/movies_home_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  List<Widget> screens = [
    const MoviesHomeScreen(),
    const Center(child: Text('TV Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: screens,
      ),
      bottomNavigationBar: WaterDropNavBar(
        inactiveIconColor: Colors.white,
        waterDropColor: Colors.teal,
        backgroundColor: Color(0xFF1E1E29),
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad,
          );
        },
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(filledIcon: MdiIcons.movie, outlinedIcon: MdiIcons.movie),
          BarItem(filledIcon: Icons.tv, outlinedIcon: Icons.tv_outlined),
        ],
      ),
    );
  }
}
