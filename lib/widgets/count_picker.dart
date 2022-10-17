import 'package:flutter/material.dart';

/// Selects a number that can be changed with increase / decrease buttons
class CountPicker extends StatefulWidget {
  /// onChange triggers when value changed
  final ValueChanged<int>? onChange;

  /// initial value
  final int value;

  /// IconButton size
  final CountPickerButtonSize? buttonSize;

  /// Custom add Icon for Iconbutton
  final IconData? addIcon;

  /// Custom remove Icon for Iconbutton
  final IconData? removeIcon;

  /// Custom TextStyle
  final TextStyle? textStyle;

  const CountPicker({
    Key? key,
    this.buttonSize = CountPickerButtonSize.small,
    this.onChange,
    this.value = 1,
    this.addIcon = Icons.add,
    this.removeIcon = Icons.remove,
    this.textStyle,
  }) : super(key: key);

  @override
  createState() => _CountPickerState();
}

enum CountPickerButtonSize { small, big }

class _CountPickerState extends State<CountPicker> {
  late int _val;
  late double _butonWidth;
  late double _butonHeight;
  late TextStyle _textStye;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Ink(
          width: _butonWidth,
          height: _butonHeight,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blue),
          ),
          child: IconButton(
            icon: Icon(widget.addIcon),
            onPressed: increase,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            _val.toString(),
            style: _textStye,
          ),
        ),
        Ink(
          width: _butonWidth,
          height: _butonHeight,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blue),
          ),
          child: IconButton(
            icon: Icon(widget.removeIcon),
            onPressed: decrease,
          ),
        )
      ],
    );
  }

  void decrease() {
    int newVal = _val - 1;
    if (newVal < 0) newVal = 0;
    setState(() {
      _val = newVal;
    });
    onChange();
  }

  void increase() {
    int newVal = _val + 1;
    setState(() {
      _val = newVal;
    });
    onChange();
  }

  @override
  void initState() {
    super.initState();
    _val = widget.value;
    if (widget.buttonSize == CountPickerButtonSize.small) {
      _butonWidth = 40;
      _butonHeight = 40;
    }
    if (widget.buttonSize == CountPickerButtonSize.big) {
      _butonWidth = 80;
      _butonHeight = 50;
    }

    _textStye = widget.textStyle ??
        const TextStyle(
          color: Colors.black,
          fontSize: 24,
        );
  }

  void onChange() {
    widget.onChange ?? (_val);
  }
}
