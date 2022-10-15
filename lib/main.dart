import 'package:flutter/material.dart';
import 'package:reusable_widgets/widgets/buttons/cupertino_switch_button.dart';

import 'widgets/buttons/custom_gradient_elevatedbutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyReusableWidgetView(),
    );
  }
}

class MyReusableWidgetView extends StatefulWidget {
  const MyReusableWidgetView({super.key});

  @override
  State<MyReusableWidgetView> createState() => _MyReusableWidgetViewState();
}

class _MyReusableWidgetViewState extends State<MyReusableWidgetView> {
  bool cupertinoSwitchValue = false; //CUPERTINOSWITCHBUTTON VALUE
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                ///[CustomCupertinoSwitch Area!]
                child: buildCustomCupertionoSwitchButton(),
              ),
              SliverToBoxAdapter(

                  ///[CustomGradientElevatedButton Area!]
                  child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: buildCustomGradientElevatedButton(),
              ))
            ],
          ),
        ),
      ),
    );
  }

  CustomGradientElevatedButton buildCustomGradientElevatedButton() {
    return CustomGradientElevatedButton(
      onPressed: () {},
      borderRadius: BorderRadius.circular(20),
      child: const Text('SIGN IN'),
    );
  }

  Row buildCustomCupertionoSwitchButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('OPTIONS'),
        CustomCupertinoSwitch(
          customScale: .5, //indicator size
          value: cupertinoSwitchValue,
          onChanged: (value) {
            setState(() {
              cupertinoSwitchValue = value;
            });
          },
        ),
      ],
    );
  }
}
