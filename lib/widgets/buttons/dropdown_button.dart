import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final bool isBordered;
  final Widget? icon;
  final Object? value;
  final List<DropdownMenuItem<Object>>? items;
  final String? Function(dynamic)? validator;
  final String? labelText;
  final EdgeInsetsGeometry? padding;
  final TextStyle? labelTextStyle;
  final InputBorder? border;
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  final TextStyle? style;
  const CustomDropdownButtonFormField(
      {Key? key,
      this.value,
      this.items,
      this.validator,
      this.labelText,
      this.padding,
      this.isBordered = false,
      this.labelTextStyle,
      this.border,
      this.focusBorder,
      this.enabledBorder,
      this.icon,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 20,
          ),
      child: DropdownButtonFormField(
        icon: icon,
        style: style,
        decoration: isBordered
            ? const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1.0),
                ),
              )
            : InputDecoration(
                labelText: labelText ?? '',
                labelStyle: labelTextStyle,
                border: border ??
                    const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.2),
                    ),
                focusedBorder: focusBorder ??
                    const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.2),
                    ),
                enabledBorder: enabledBorder ??
                    const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.2),
                    ),
              ),
        validator: validator,
        value: value,
        onChanged: (value) {
          if (kDebugMode) {
            print(value);
          }
        },
        onSaved: (value) {},
        items: items,
      ),
    );
  }
}
