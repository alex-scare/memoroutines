import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memoroutines/shared/theme.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key? key,
    this.onChanged,
    this.label,
    this.autofocus = false,
    this.initialValue,
    this.placeholder,
    this.labelColor,
    this.textColor,
    this.textStyle = const TextStyle(),
    this.labelStyle = const TextStyle(),
    this.maxLines = 1,
    this.minLines = 1,
    this.labelWidth,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
  }) : super(key: key);

  final String? initialValue;
  final bool autofocus;
  final void Function(String? value)? onChanged;
  final int maxLines;
  final int minLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle textStyle;
  final Color? textColor;
  final String? placeholder;
  final String? label;
  final TextStyle labelStyle;
  final Color? labelColor;
  final double? labelWidth;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: textStyle.copyWith(
          color: context.colors.onBackground.withOpacity(0.5),
        ),
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
      ),
      enabled: enabled,
      validator: validator,
      initialValue: initialValue,
      textAlignVertical: TextAlignVertical.top,
      textAlign: TextAlign.start,
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      style: textStyle.copyWith(
        color: textColor ?? context.colors.onBackground,
      ),
    );
  }
}
