import 'package:flutter/material.dart';
import 'package:reusable_widgets/widgets/buttons/cupertino_switch_button.dart';
import 'package:reusable_widgets/widgets/buttons/custom_outline_textbutton.dart';
import 'package:reusable_widgets/widgets/count_picker.dart';

import 'widgets/animation/animation_container_widget.dart';
import 'widgets/animation/animation_hero_widget.dart';
import 'widgets/buttons/custom_gradient_elevatedbutton.dart';
import 'widgets/buttons/custom_toggle_button.dart';
import 'widgets/buttons/dropdown_button.dart';

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
      home: const AnimatedContainerWidget(),
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
  List<bool> toggleButtonItemsSelected = [true, false]; //TOGGLE BUTTON VALUE
  String? selectedCountry = 'Türkiye'; //DROPDOWN VALUE
  List<String> listOfCountry = ['Türkiye', 'Almanya']; //DROPDOWN VALUE
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
              )),
              SliverToBoxAdapter(

                  ///[CustomGradientElevatedButton Area!]
                  child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: CustomToggleButton(
                  isSelected: toggleButtonItemsSelected,
                  onPressed: (value) => tabChange(value),
                ),
              )),
              SliverToBoxAdapter(

                  ///[CustomDropdownButtonFormField Area!]
                  child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: buildDefaultCustomDropdown())),
              SliverToBoxAdapter(
                  //BORDERED DROPDOWN
                  ///[CustomDropdownButtonFormField Area!]
                  child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: buildBorderedCustomDropdown())),
              SliverToBoxAdapter(

                  ///[CustomOutlineTextButton Area!]
                  child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: buildCustomOutlineTextButton())),
              SliverToBoxAdapter(

                  ///[CountPicker Area!]
                  child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: buildCountPicker())),
              SliverToBoxAdapter(

                  ///[CountPicker Area!]
                  child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: buildHeroWidgetScreen())),
            ],
          ),
        ),
      ),
    );
  }

  CustomOutlineTextButton buildCustomOutlineTextButton() {
    return CustomOutlineTextButton(
      buttonText: 'OUTLINE TEXTBUTTON',
      onPressed: () {},
    );
  }

  CustomDropdownButtonFormField buildDefaultCustomDropdown() {
    return CustomDropdownButtonFormField(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      labelText: 'LABEL',
      labelTextStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      value: selectedCountry,
      items: listOfCountry.map((String val) {
        return DropdownMenuItem(
          alignment: Alignment.centerLeft,
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }

  CustomDropdownButtonFormField buildBorderedCustomDropdown() {
    return CustomDropdownButtonFormField(
      isBordered: true, //!!!!
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      labelText: 'LABEL',
      labelTextStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      value: selectedCountry,
      items: listOfCountry.map((String val) {
        return DropdownMenuItem(
          alignment: Alignment.centerLeft,
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
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

  Widget buildCountPicker() {
    return const CountPicker();
  }

  CustomOutlineTextButton buildHeroWidgetScreen() {
    return CustomOutlineTextButton(
      buttonText: 'GO TO HERO WİDGET SCREEN',
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AnimationHeroWidget()));
      },
    );
  }

  ///[TOGGLE BUTTON TAB CHANGE FUNCTION]
  tabChange(int newIndex) {
    for (int index = 0; index < toggleButtonItemsSelected.length; index++) {
      if (index == newIndex) {
        setState(() {
          toggleButtonItemsSelected[index] = true;
          //print(index); //button index no
        });
      } else {
        setState(() {
          toggleButtonItemsSelected[index] = false;
          //print(index); //button index no
        });
      }
      setState(() {});
    }
  }
}
