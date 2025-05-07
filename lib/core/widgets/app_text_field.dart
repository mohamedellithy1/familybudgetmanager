import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled({
    super.key,
    required this.controller,
    this.textInputType,
    this.onChanged,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.counterStyle,
    this.onEdittingComplete,
    this.suffixIcon,
    this.enabled = true,
    this.hintText,
    this.maxLength,
    this.obscureText = false,
    this.counterText,
    this.labelText,
    this.validation,
    this.prefixIcon,
  });
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final bool? obscureText;

  final String? hintText;
  final String? labelText;
  final Function(String?)? validation;
  final TextInputType? textInputType;
  final Function(String)? onChanged;

  final void Function()? onTap;
  final bool readOnly;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  final Function? onEdittingComplete;
  final TextStyle? counterStyle;
  final String? counterText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged != null ? (value) => onChanged!(value) : null,
      onTap: onTap != null ? () => onTap!() : null,
      onEditingComplete: onEdittingComplete as void Function()?,
      controller: controller,
      obscureText: obscureText!,
      keyboardType: textInputType,
      enabled: enabled,
      maxLength: maxLength,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        counterStyle: counterStyle,
        suffixIcon: suffixIcon,
        counterText: counterText,
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      validator: (value) {
        return validation!(value);
      },
    );
  }
}
