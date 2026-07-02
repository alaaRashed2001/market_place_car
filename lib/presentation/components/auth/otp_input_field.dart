import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/responsive_layout_extention.dart';
import 'package:market_place_car/core/shared_component/app_text_form_field.dart';

class OtpInputField extends StatelessWidget {
  final int length;
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;

  const OtpInputField({
    super.key,
    this.length = 4,
    required this.controllers,
    required this.focusNodes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Padding(
          padding: context.spaceHorizontal(6),
          child: SizedBox(
            width: context.wp(18),
            height: context.hp(6),
            child: AppTextFormField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              inputType: TextInputType.number,
              inputAction: index == length - 1
                  ? TextInputAction.done
                  : TextInputAction.next,
              onChanged: (value) => _onOtpChanged(
                value: value,
                index: index,
                length: length,
                focusNodes: focusNodes,
                context: context,
              ),
            ),
          ),
        );
      }),
    );
  }

  void _onOtpChanged({
    required String value,
    required int index,
    required int length,
    required List<FocusNode> focusNodes,
    required BuildContext context,
  }) {
    if (value.isNotEmpty) {
      if (index < length - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }
}
