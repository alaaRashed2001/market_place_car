import 'package:flutter/material.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/responsive_layout_extention.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';

class AppTextFormField extends StatefulWidget {
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
  final VoidCallback? onClear;

  const AppTextFormField({
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
    this.onClear,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool showPassword = widget.obscure;

  late bool _isTyping = widget.controller.text.isNotEmpty;
  @override
  void initState() {
    super.initState();
    if (widget.isSearch) {
      widget.controller.addListener(_handleSearchTextChange);
    }
  }

  void _handleSearchTextChange() {
    final hasText = widget.controller.text.isNotEmpty;
    if (hasText != _isTyping) {
      setState(() => _isTyping = hasText);
    }
  }

  @override
  void dispose() {
    if (widget.isSearch) {
      widget.controller.removeListener(_handleSearchTextChange);
    }
    super.dispose();
  }

  void _clearSearch() {
    widget.controller.clear();
    widget.onChanged?.call('');
    widget.onClear?.call();
  }

  void _togglePasswordVisibility() {
    setState(() => showPassword = !showPassword);
  }

  Widget? _buildPrefixIcon() {
    if (!widget.isSearch) return widget.prefixImage;
    if (_isTyping) return null;
    return const Icon(Icons.search);
  }

  Widget? _buildSuffixIcon() {
    if (widget.isSearch) {
      return _isTyping ? _buildClearButton() : null;
    }
    return widget.obscure ? _buildPasswordToggle() : null;
  }

  Widget _buildClearButton() {
    return InkWell(
      onTap: widget.readOnly ? null : _clearSearch,
      child: AppAssetHelper.svgImage(AppImages.delete,
      ).pad(12),
    );
  }

  Widget _buildPasswordToggle() {
    return InkWell(
      onTap: widget.readOnly ? null : _togglePasswordVisibility,
      child: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
    );
  }

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
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: _buildSuffixIcon(),
      ),
    );
  }
}
