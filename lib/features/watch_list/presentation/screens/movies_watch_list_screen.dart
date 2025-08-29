import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/custom_watch_list_grid.dart';

class MoviesWatchListScreen extends StatelessWidget {
  const MoviesWatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0b0213), Color(0xFF1a0933)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  pinned: true,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.clear_all_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'My Watchlist',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                const CustomWatchListGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
