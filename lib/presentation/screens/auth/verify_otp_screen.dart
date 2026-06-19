import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/extension/sized_box_extension.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/presentation/components/shared_component/app_primary_button.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_state.dart';
import 'package:market_place_car/presentation/helper/navigator_helper.dart';
import 'package:market_place_car/presentation/screens/auth/create_new_password_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phone;
  const VerifyOtpScreen({super.key, required this.phone});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  int _seconds = 59;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = 59;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  void _verifyOtp() {
    if (_otpController.text.length == 4) {
      context.read<AuthCubit>().verifyOTP(
            phoneNumber: widget.phone,
            otp: _otpController.text,
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a 4-digit code'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.verification),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is OTPSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP Verified successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            NavigatorHelper.jump(
              context,
              screen: CreateNewPasswordScreen(phone: widget.phone),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Icon(
                    Icons.mark_email_read_outlined,
                    size: 80,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                  24.height,
                  Text(
                    l.verifyPhoneNumber,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  12.height,
                  Text(
                    l.otpSentTo(widget.phone),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.white60 : Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  36.height,

                  // OTP Field (can use a simple Row of Inputs or custom OTP field if available)
                  // Let's implement a neat OTP input style using standard Row of TextFields or custom UI
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 240,
                        child: TextField(
                          controller: _otpController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 24,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            hintText: '0000',
                            hintStyle: TextStyle(
                              color: isDark ? Colors.white12 : Colors.grey.shade300,
                              letterSpacing: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  36.height,

                  // Timer or Resend Code
                  _seconds > 0
                      ? Text(
                          l.resendCodeIn(_seconds),
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Colors.white38 : Colors.grey,
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            _startTimer();
                            context.read<AuthCubit>().forgotPassword(phoneNumber: widget.phone);
                          },
                          child: Text(
                            l.resendCode,
                            style: const TextStyle(
                              color: Color(0xffff8a3d),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                  48.height,

                  AppPrimaryButton(
                    text: l.verify,
                    isLoading: isLoading,
                    onPressed: _verifyOtp,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
