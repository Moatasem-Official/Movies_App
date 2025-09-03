import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movies_app/features/discover_movies/presentation/screens/discover_movies_screen.dart';
import 'package:movies_app/features/home/presentation/screens/movies_home_screen.dart';
import 'package:movies_app/features/movies_search/presentation/screens/search_all_movies_screen.dart';
import 'package:movies_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:movies_app/features/watch_list/presentation/screens/movies_watch_list_screen.dart';
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
    const SearchAllMoviesScreen(),
    const DiscoverMoviesScreen(),
    const MoviesWatchListScreen(),
    const SettingsScreen(),
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
          const NavigationBarButton(
            text: 'Discover',
            icon: Icons.explore_outlined,
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF141E30), Color(0xFF243B55)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          const NavigationBarButton(
            text: 'Watch List',
            icon: Icons.bookmark,
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF141E30), Color(0xFF243B55)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          const NavigationBarButton(
            text: 'Settings',
            icon: Icons.settings,
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF42275a), Color(0xFF734b6d)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ],
      ),
    );
  }
}
