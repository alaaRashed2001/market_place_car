import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/responsive_layout_extention.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/core/shared_component/custom_elevated_button.dart';
import 'package:market_place_car/core/shared_component/back_icon_button.dart';
import 'package:market_place_car/presentation/components/auth/otp_input_field.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_state.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';
import 'package:market_place_car/presentation/helper/snack_bar_helper.dart';
import 'package:market_place_car/presentation/screens/auth/create_new_password_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phone;
  const VerifyOtpScreen({super.key, required this.phone});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
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

  String get _otpCode => _otpControllers.map((c) => c.text).join();
  @override
  void dispose() {
    _timer?.cancel();

    for (var c in _otpControllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _verifyOtp() {
    final code = _otpCode;

    if (code.length == 4) {
      context.read<AuthCubit>().verifyOTP(phoneNumber: widget.phone, otp: code);
    } else {
      SnackBarHelper.showSnackBar(
        context,
        message: 'Please enter a 4-digit code',
        error: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is OTPSuccess) {
            SnackBarHelper.showSnackBar(
              context,
              message: 'OTP Verified successfully!',
              error: false,
            );

            // NavigatorHelper.jump(
            //   context,
            //   screen: CreateNewPasswordScreen(phone: widget.phone),
            // );
          } else if (state is AuthError) {
            SnackBarHelper.showSnackBar(
              context,
              message: state.message,
              error: true,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(alignment: Alignment.topLeft, child: BackIconButton()),
                AppAssetHelper.svgImage(
                  AppImages.verifyPhone,
                  width: context.wp(22),
                  height: context.hp(11),
                ).padTop(40),

                Text(
                  l.verifyPhoneNumber,
                  style: context.font18Bold,
                  textAlign: TextAlign.center,
                ).padTop(16),

                context.addVerticalSpace(18),

                Text(
                  l.otpSentTo(widget.phone),
                  textAlign: TextAlign.center,
                  style: context.font14Regular,
                ).padSymmetricHorizon(34),
                OtpInputField(
                  controllers: _otpControllers,
                  focusNodes: _focusNodes,
                ).padTop(32),

                CustomElevatedButton(
                  text: l.verify,
                  isLoading: isLoading,
                  onPressed: _verifyOtp,
                ).padTop(32),

                context.addVerticalSpace(32),

                _seconds > 0
                    ? Text(
                        l.resendCodeIn(_seconds),
                        style: context.font16Regular?.copyWith(
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                        ),
                      )
                    : Text("data")
                // AppTextButton(
                //         onPressed: () {
                //           _startTimer();
                //           context.read<AuthCubit>().forgotPassword(
                //             phoneNumber: widget.phone,
                //           );
                //         },
                //         text: l.resendCode,
                //       ),
              ],
            ),
          );
        },
      ),
    );
  }
}
