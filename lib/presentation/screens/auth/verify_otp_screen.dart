import 'package:flutter/material.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phone;
  const VerifyOtpScreen({super.key, required this.phone});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final int _seconds = 56;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Scaffold(
      body: Column(
        children: [
          Text(l.verifyPhoneNumber),
          // placeholder تلقائي
          Text(l.otpSentTo(widget.phone)),
          // countdown مع placeholder
          Text(l.resendCodeIn(_seconds)),
          ElevatedButton(onPressed: () {}, child: Text(l.verify)),
        ],
      ),
    );
  }
}
