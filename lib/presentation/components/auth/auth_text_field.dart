import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/responsive_layout_extention.dart';

class AuthTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool obscure;
  final TextEditingController controller;
  final Widget? prefixImage;
  final bool readOnly;
  final VoidCallback? onTapField;
  final bool isSearch;
  final Color? hintColor;
  final Color? labelColor;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final String? Function(String?)? validator;
  final int maxLines;

  const AuthTextField({
    super.key,
    this.hintText,
    this.inputType,
    this.inputAction,
    this.obscure = false,
    required this.controller,
    this.focusNode,
    this.prefixImage,
    this.readOnly = false,
    this.isSearch = false,
    this.hintColor,
    this.labelColor,
    this.onChanged,
    this.onSubmit,
    this.onTapField,
    this.validator,
    this.maxLines = 1,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool showPassword = widget.obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,

      obscureText: widget.obscure ? showPassword : false,
      readOnly: widget.readOnly,
      onTap: widget.onTapField,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmit,
      keyboardType: widget.inputType,
      textInputAction: widget.inputAction,
      validator: widget.validator,
      maxLines: widget.obscure ? 1 : widget.maxLines,
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: context.hp(1.8),
          horizontal: context.wp(4.4),
        ),
        hintText: widget.hintText,
        prefixIcon: widget.isSearch
            ? const Icon(Icons.search)
            : widget.prefixImage,
        suffixIcon: widget.obscure
            ? InkWell(
                onTap: widget.readOnly
                    ? null
                    : () => setState(() => showPassword = !showPassword),
                child: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
