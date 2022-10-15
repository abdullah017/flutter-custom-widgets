import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoSwitch extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;
  final Decoration? customDecoration;
  final double? customWidth;
  final double? customHeight;
  final double? customScale;
  final Color? customTrackColor;
  final Color? customActiveColor;
  final Color? customThumbColor;
  const CustomCupertinoSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.customDecoration,
    this.customWidth,
    this.customHeight,
    this.customScale,
    this.customTrackColor,
    this.customActiveColor,
    this.customThumbColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customDecoration ??
          BoxDecoration(
              border: Border.all(
                  color: value
                      ? CupertinoColors.activeOrange
                      : CupertinoColors.black,
                  width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: SizedBox(
        width: customWidth ?? 33,
        height: customHeight ?? 17,
        child: Transform.scale(
          transformHitTests: false,
          scale: customScale ?? .7, // indicator size
          child: CupertinoSwitch(
            value: value,
            trackColor: customTrackColor ?? Colors.transparent,
            onChanged: onChanged,
            activeColor: customTrackColor ?? Colors.transparent,
            thumbColor:
                value ? CupertinoColors.activeOrange : CupertinoColors.black,
          ),
        ),
      ),
    );
  }
}
