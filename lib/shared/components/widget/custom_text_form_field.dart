import 'package:flutter/material.dart';

/// {@template custom_text_form_field}
/// [CustomTextFormField] returns a statefull widget
/// {@endtemplate}
class CustomTextFormField extends StatefulWidget {
  /// {@macro custom_text_form_field}
  const CustomTextFormField({
    super.key,
    required this.textInputAction,
    this.margin,
    this.padding,
    this.style,
    this.decoration,
    this.expands = false,
  });

  final TextInputAction? textInputAction;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  final TextStyle? style;

  final bool? expands;

  final InputDecoration? decoration;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: TextFormField(
        style: widget.style,
        decoration: widget.decoration,
        textInputAction: widget.textInputAction,
      ),
    );
  }
}
