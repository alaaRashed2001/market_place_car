import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/opacity_of_color.dart';
import 'package:market_place_car/core/extension/sized_box_extension.dart';

class AuthTextField extends StatefulWidget {
  final String? hintText;
  final String? label;
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
  final double? width;

  const AuthTextField({
    super.key,
    this.hintText,
    this.label,
    this.inputType,
    this.inputAction,
    this.obscure = false,
    required this.controller,
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
    this.width,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool showPassword = widget.obscure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label ?? "",
            style: TextStyle(
              color:
                  widget.labelColor ??
                  theme.textTheme.bodyMedium?.color?.changeOpacity(0.9),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          10.height,
        ],

        SizedBox(
          width: widget.width ?? double.infinity,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscure ? showPassword : false,
            readOnly: widget.readOnly || widget.onTapField != null,
            onTap: widget.onTapField,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmit,
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
            validator: widget.validator,
            maxLines: widget.obscure ? 1 : widget.maxLines,
            cursorColor: theme.textSelectionTheme.cursorColor ?? Colors.black,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              hintStyle: widget.hintText != null
                  ? theme.inputDecorationTheme.hintStyle?.copyWith(
                      color: widget.hintColor,
                    )
                  : null,

              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              prefixIcon: widget.isSearch
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.search, color: theme.hintColor),
                    )
                  : (widget.prefixImage != null
                        ? Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 16,
                              end: 12,
                            ),
                            child: widget.prefixImage,
                          )
                        : null),

              suffixIcon: widget.obscure
                  ? InkWell(
                      onTap: widget.readOnly
                          ? null
                          : () => setState(() => showPassword = !showPassword),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: theme.iconTheme.color?.changeOpacity(0.6),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
