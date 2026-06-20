import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/opacity_of_color.dart';
import 'package:market_place_car/presentation/components/shared_component/app_bottom_sheet.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  void _handleSocialLogin(BuildContext context, String provider) {
    AppBottomSheet.show(
      context: context,
      isScrollable: false,
      builder: (sheetContext, _) {
        return _MockOAuthBottomSheet(
          provider: provider,
          onSuccess: (token) {
            Navigator.pop(sheetContext);
            context.read<AuthCubit>().socialLogin(
              provider: provider,
              token: token,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          icon: Icons.cloud_done_rounded,
          tooltip: "Cloud Login",
          color: const Color(0xFF4285F4), // Google Blue
          onTap: () => _handleSocialLogin(context, 'google'),
        ),
        const SizedBox(width: 20),
        _SocialButton(
          icon: Icons.facebook_rounded,
          tooltip: "Facebook Login",
          color: const Color(0xFF1877F2), // FB Blue
          onTap: () => _handleSocialLogin(context, 'facebook'),
        ),
        const SizedBox(width: 20),
        _SocialButton(
          icon: Icons.terminal_rounded, // Represents GitHub/Developer login
          tooltip: "GitHub Login",
          color: isDark ? Colors.white : const Color(0xFF24292E), // GitHub Dark
          onTap: () => _handleSocialLogin(context, 'github'),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final Color color;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.tooltip,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E22) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.changeOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: isDark
                  ? Colors.white.changeOpacity(0.05)
                  : Colors.grey.shade200,
            ),
          ),
          child: Center(child: Icon(icon, size: 28, color: color)),
        ),
      ),
    );
  }
}

class _MockOAuthBottomSheet extends StatefulWidget {
  final String provider;
  final ValueChanged<String> onSuccess;

  const _MockOAuthBottomSheet({
    required this.provider,
    required this.onSuccess,
  });

  @override
  State<_MockOAuthBottomSheet> createState() => _MockOAuthBottomSheetState();
}

class _MockOAuthBottomSheetState extends State<_MockOAuthBottomSheet> {
  bool _authenticating = false;

  String get _providerName {
    switch (widget.provider) {
      case 'facebook':
        return 'Facebook';
      case 'github':
        return 'GitHub';
      case 'google':
      default:
        return 'Cloud / Google';
    }
  }

  Color get _providerColor {
    switch (widget.provider) {
      case 'facebook':
        return const Color(0xFF1877F2);
      case 'github':
        return const Color(0xFF24292E);
      case 'google':
      default:
        return const Color(0xFF4285F4);
    }
  }

  IconData get _providerIcon {
    switch (widget.provider) {
      case 'facebook':
        return Icons.facebook_rounded;
      case 'github':
        return Icons.terminal_rounded;
      case 'google':
      default:
        return Icons.cloud_done_rounded;
    }
  }

  void _signIn() async {
    setState(() => _authenticating = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      widget.onSuccess(
        'mock_oauth_token_${widget.provider}_${DateTime.now().millisecondsSinceEpoch}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.spaceSymmetric(horizontal: 24, vertical: 32),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _authenticating
                ? const SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(Color(0xffff8a3d)),
                    ),
                  )
                : Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: _providerColor.changeOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(_providerIcon, size: 40, color: _providerColor),
                  ),
          ),
          const SizedBox(height: 24),

          Text(
            _authenticating
                ? "Connecting Account..."
                : "Sign in with $_providerName",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Text(
            _authenticating
                ? "Please wait while we secure your connection."
                : "CarAds wants to access your public profile and email address to create your secure account.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 36),

          if (!_authenticating) ...[
            // Account Option Box
            InkWell(
              onTap: _signIn,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: _providerColor,
                      radius: 20,
                      child: const Text(
                        "AR",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alaa Rashed",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "alaa.rashed@gmail.com",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Cancel Button
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ] else ...[
            const SizedBox(height: 60),
          ],
        ],
      ),
    );
  }
}
