import 'package:flutter/material.dart';
import 'package:market_place_car/presentation/screens/add/add_screen.dart';
import 'package:market_place_car/presentation/screens/custom_bottom_nav_bar.dart';
import 'package:market_place_car/presentation/screens/explore/explore_screen.dart';
import 'package:market_place_car/presentation/screens/history/history_screen.dart';
import 'package:market_place_car/presentation/screens/home/home_screen.dart';
import 'package:market_place_car/presentation/screens/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ExploreScreen(),
    AddScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
