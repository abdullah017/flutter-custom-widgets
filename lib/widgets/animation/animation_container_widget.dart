// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class AnimatedContainerWidget extends StatelessWidget {
  const AnimatedContainerWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: AnimatedContainerDemo(),
        ),
      ),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool selected = false;
  bool mShapeSelected = false;
  bool mProgressSelected = false;
  bool mBorder = false;
  var mValue = 0.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  var mColorPrimary = Colors.red;
  final mDividerColor = Colors.green;

  init() async {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      setState(() {
        mColorPrimary = mDividerColor; //change color
        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Change color and border",
            style: boldTextStyle(),
          ).paddingBottom(16),
          AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return AnimatedContainer(
                  color: mColorPrimary,
                  duration: const Duration(seconds: 2),
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                );
              }).center(),
          30.height,
          GestureDetector(
            onTap: () {
              setState(() {
                mBorder = !mBorder;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.all(
                  color: Colors.grey,
                  width: mBorder ? 6.0 : 0.0,
                ),
              ),
              child: const SizedBox(
                width: 100,
                height: 100,
              ),
            ),
          ).center(),
          16.height,
          Text(
            "Shape",
            style: boldTextStyle(),
          ).paddingBottom(16),
          GestureDetector(
            onTap: () {
              setState(() {
                mShapeSelected = !mShapeSelected;
              });
            },
            child: AnimatedContainer(
              width: mShapeSelected ? 150.0 : 100.0,
              height: mShapeSelected ? 150.0 : 100.0,
              color: mShapeSelected ? Colors.blueGrey : Colors.green,
              alignment: mShapeSelected
                  ? Alignment.center
                  : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Container(),
            ),
          ).center(),
          18.height,
          Text(
            "Progress",
            style: boldTextStyle(),
          ).paddingBottom(16),
          GestureDetector(
            onTap: () {
              setState(() {
                mProgressSelected = !mProgressSelected;
              });
            },
            child: AnimatedContainer(
              width:
                  mProgressSelected ? MediaQuery.of(context).size.width : 100.0,
              height: 10,
              decoration: BoxDecoration(
                color: const Color(0xFF0099EE),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment:
                  mProgressSelected ? Alignment.topLeft : Alignment.topRight,
              duration: const Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              child: Container(),
            ),
          ).center(),
        ],
      ),
    );
  }
}
