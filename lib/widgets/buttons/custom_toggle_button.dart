import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? firstText;
  final String? secondText;
  final String? thirdText;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? color;
  final Color? fillColor;
  final Color? borderColor;
  final List<bool> isSelected;
  final Function(int)? onPressed;
  final List<Widget>? newChildren;

  const CustomToggleButton(
      {Key? key,
      this.firstText,
      this.secondText,
      this.thirdText,
      this.onPressed,
      this.backgroundColor,
      required this.isSelected,
      this.newChildren,
      this.selectedColor,
      this.color,
      this.fillColor,
      this.borderColor,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 350,
      height: height ?? 30,
      color: backgroundColor ?? Colors.white,
      child: ToggleButtons(
          isSelected: isSelected,
          selectedColor: selectedColor ?? Colors.white,
          color: color ?? Colors.orange,
          fillColor: fillColor ?? Colors.orange,
          renderBorder: true,
          borderColor: borderColor ?? Colors.orange,
          borderWidth: 0,
          //splashColor: Colors.red,
          highlightColor: Colors.orange,
          onPressed: onPressed,
          children: newChildren ??
              <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(firstText ?? 'FIRST',
                      style: const TextStyle(fontSize: 12)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(secondText ?? 'SECOND',
                      style: const TextStyle(fontSize: 12)),
                ),
              ]),
    );
  }
}
