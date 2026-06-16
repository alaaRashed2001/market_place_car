import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  final List<TextEditingController> controllers;
  final ValueChanged<String> onCompleted;

  const OtpField({
    super.key,
    required this.controllers,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controllers.length, (i) {
        return Container(
          width: 52,
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: TextField(
            controller: controllers[i],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(counterText: ''),
            onChanged: (val) {
              if (val.isNotEmpty && i < controllers.length - 1) {
                FocusScope.of(context).nextFocus();
              }
              final otp = controllers.map((c) => c.text).join();
              if (otp.length == controllers.length) onCompleted(otp);
            },
          ),
        );
      }),
    );
  }
}
