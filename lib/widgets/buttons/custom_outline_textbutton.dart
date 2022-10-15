import 'package:flutter/material.dart';

class CustomOutlineTextButton extends StatelessWidget {
  const CustomOutlineTextButton({
    Key? key,
    required this.buttonText,
    this.buttonTextStyle,
    this.fixedSize,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Size? fixedSize;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.orange),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(
            fixedSize ?? const Size(290, 35),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(buttonText, style: buttonTextStyle),
        ));
  }
}
