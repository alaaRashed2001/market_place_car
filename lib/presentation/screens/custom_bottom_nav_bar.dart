// import 'package:flutter/material.dart';
// import 'package:market_place_car/core/constants/app_images.dart';
// import 'package:market_place_car/presentation/helper/app_asset_helper.dart';
//
// class CustomBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const CustomBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: onTap,
//       iconSize: 24,
//       type: BottomNavigationBarType.fixed,
//       items: _buildNavItems(),
//     );
//   }
//
//   List<BottomNavigationBarItem> _buildNavItems() {
//     return [
//       _navItem(
//         iconPath: AppImages.home,
//         activeIconPath: AppImages.homeActive,
//         label: 'Home',
//       ),
//       _navItem(
//         iconPath: AppImages.explore,
//         activeIconPath: AppImages.exploreActive,
//         label: 'Explore',
//       ),
//       _navItem(
//         iconPath: AppImages.add,
//         activeIconPath: AppImages.addActive,
//         label: 'Add',
//       ),
//       _navItem(
//         iconPath: AppImages.history,
//         activeIconPath: AppImages.historyActive,
//         label: 'History',
//       ),
//       _navItem(
//         iconPath: AppImages.profile,
//         activeIconPath: AppImages.profileActive,
//         label: 'Profile',
//       ),
//     ];
//   }
//
//   BottomNavigationBarItem _navItem({
//     required String iconPath,
//     required String activeIconPath,
//     required String label,
//   }) {
//     return BottomNavigationBarItem(
//       icon: AppAssetHelper.svgImage(iconPath, width: 24, height: 24),
//       activeIcon: AppAssetHelper.svgImage(
//         activeIconPath,
//         width: 24,
//         height: 24,
//       ),
//       label: label,
//     );
//   }
// }