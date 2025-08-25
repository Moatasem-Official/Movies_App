import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movies_app/Movies/features/home/presentation/screens/movies_home_screen.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  PageController pageController = PageController();
  List<Widget> screens = [
    const MoviesHomeScreen(),
    const Center(child: Text('TV Screen')),
  ];
  int _selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        itemCount: screens.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => screens[index],
      ),
      bottomNavigationBar: ResponsiveNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChange: changeTab,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.black.withOpacity(0.85),
        navigationBarButtons: <NavigationBarButton>[
          NavigationBarButton(
            text: 'Home',
            icon: MdiIcons.home,
            backgroundGradient: const LinearGradient(
              colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          NavigationBarButton(
            text: 'Search',
            icon: MdiIcons.magnify,
            backgroundGradient: const LinearGradient(
              colors: [Color(0xFF232526), Color(0xFF414345)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          NavigationBarButton(
            text: 'Watch List',
            icon: Icons.bookmark,
            backgroundGradient: const LinearGradient(
              colors: [Color(0xFF232526), Color(0xFF414345)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          NavigationBarButton(
            text: 'Profile',
            icon: MdiIcons.account,
            backgroundGradient: const LinearGradient(
              colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ],
      ),
    );
  }
}
