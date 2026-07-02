import 'package:flutter/material.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';
import 'package:market_place_car/presentation/screens/add/add_screen.dart';
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
    final colors = Theme.of(context).appColors;
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 24,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: AppAssetHelper.svgImage(
              AppImages.home,
              width: 24,
              height: 24,
              color: colors.bottomNavInactiveColor,
            ),
            activeIcon: AppAssetHelper.svgImage(
              AppImages.homeActive,
              width: 24,
              height: 24,
              color: colors.bottomNavActiveColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: AppAssetHelper.svgImage(
              AppImages.explore,
              width: 24,
              height: 24,
              color: colors.bottomNavInactiveColor,
            ),
            activeIcon: AppAssetHelper.svgImage(
              AppImages.exploreActive,
              width: 24,
              height: 24,
              color: colors.bottomNavActiveColor,
            ),
            label: 'explore',
          ),
          BottomNavigationBarItem(
            icon: AppAssetHelper.svgImage(
              AppImages.add,
              width: 24,
              height: 24,
              color: colors.bottomNavInactiveColor,
            ),
            activeIcon: AppAssetHelper.svgImage(
              AppImages.addActive,
              width: 24,
              height: 24,
              color: colors.bottomNavActiveColor,
            ),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: AppAssetHelper.svgImage(
              AppImages.history,
              width: 24,
              height: 24,
              color: colors.bottomNavInactiveColor,
            ),
            activeIcon: AppAssetHelper.svgImage(
              AppImages.historyActive,
              width: 24,
              height: 24,
              color: colors.bottomNavActiveColor,
            ),
            label: 'history',
          ),
          BottomNavigationBarItem(
            icon: AppAssetHelper.svgImage(
              AppImages.profile,
              width: 24,
              height: 24,
              color: colors.bottomNavInactiveColor,
            ),
            activeIcon: AppAssetHelper.svgImage(
              AppImages.profileActive,
              width: 24,
              height: 24,
              color: colors.bottomNavActiveColor,
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
