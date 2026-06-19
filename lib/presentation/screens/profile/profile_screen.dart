import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/extension/sized_box_extension.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/data/services/service_locator.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';
import 'package:market_place_car/presentation/components/shared_component/theme_switch_widget.dart';
import 'package:market_place_car/presentation/components/shared_component/language_selector_widget.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/helper/navigator_helper.dart';
import 'package:market_place_car/presentation/screens/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName = 'Alaa Rashed';
  String _userEmail = 'alaa.rashed@gmail.com';
  String _userPhone = '+971 50 123 4567';

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final cardColor = Theme.of(context).cardColor;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Elegant Header Profile Card
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [const Color(0xFF0F0F1A), const Color(0xFF1E1E2C)]
                        : [const Color(0xFFFF8A3D), const Color(0xFFFFC078)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    // Profile Image placeholder with initial circle avatar
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Text(
                          "AR",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff1e1e1e),
                          ),
                        ),
                      ),
                    ),
                    12.height,
                    Text(
                      _userName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    4.height,
                    Text(
                      _userEmail,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Settings & Actions list
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Information Section
                  _buildSectionTitle(l.fullName, isDark),
                  _buildProfileInfoCard(
                    context,
                    phone: _userPhone,
                    email: _userEmail,
                    isDark: isDark,
                    cardColor: cardColor,
                  ),
                  24.height,

                  // Preferences Section
                  _buildSectionTitle("PREFERENCES / الإعدادات", isDark),
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF16161A) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.shade200,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Dark Mode Toggle row
                        ListTile(
                          leading: Icon(
                            isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                            color: isDark ? Colors.yellow : Colors.orange,
                          ),
                          title: Text(
                            isDark ? "Dark Theme" : "Light Theme",
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: const ThemeSwitchWidget(),
                        ),
                        Divider(
                          height: 1,
                          color: isDark ? Colors.white10 : Colors.grey.shade100,
                        ),
                        // Language Selector row
                        const LanguageSelectorWidget(),
                      ],
                    ),
                  ),
                  24.height,

                  // App settings list
                  _buildSectionTitle("SUPPORT / الدعم والخصوصية", isDark),
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF16161A) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.shade200,
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildActionTile(
                          icon: Icons.info_outline_rounded,
                          title: "About Us",
                          isDark: isDark,
                          onTap: () {},
                        ),
                        Divider(height: 1, color: isDark ? Colors.white10 : Colors.grey.shade100),
                        _buildActionTile(
                          icon: Icons.shield_outlined,
                          title: "Privacy Policy",
                          isDark: isDark,
                          onTap: () {},
                        ),
                        Divider(height: 1, color: isDark ? Colors.white10 : Colors.grey.shade100),
                        _buildActionTile(
                          icon: Icons.contact_support_outlined,
                          title: "Contact Support",
                          isDark: isDark,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  36.height,

                  // Logout button
                  ElevatedButton(
                    onPressed: () {
                      // Logout action
                      sl<AuthRepository>().logout();
                      context.read<AuthCubit>().logout();
                      NavigatorHelper.jump(
                        context,
                        screen: const LoginScreen(),
                        replace: true,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent.shade700,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout_rounded, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          l.logout,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          color: isDark ? Colors.white38 : Colors.black45,
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard(
    BuildContext context, {
    required String phone,
    required String email,
    required bool isDark,
    required Color cardColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF16161A) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.phone_iphone_rounded, color: Color(0xffff8a3d)),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    phone,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Colors.transparent),
          ),
          Row(
            children: [
              const Icon(Icons.email_outlined, color: Color(0xffff8a3d)),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email Address",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: isDark ? Colors.white60 : Colors.black54),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
        color: isDark ? Colors.white30 : Colors.black26,
      ),
      onTap: onTap,
    );
  }
}
