// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AnimationHeroWidget extends StatefulWidget {
  const AnimationHeroWidget({super.key});

  @override
  AnimationHeroWidgetState createState() => AnimationHeroWidgetState();
}

class AnimationHeroWidgetState extends State<AnimationHeroWidget> {
  late List<ItemModel> mListing;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    mListing = getData();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = context.width() / 2;
    double cardHeight = context.height() / 3.5;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: context.scaffoldBackgroundColor,
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mListing.length,
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: cardWidth / cardHeight),
          itemBuilder: (context, index) => Product(mListing[index], index),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Product extends StatelessWidget {
  late ItemModel model;

  Product(this.model, int pos, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(seconds: 2), // HERO DURATION
                pageBuilder: (_, __, ___) => DetailScreen(
                      name: model.name,
                      image: model.img,
                    )));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Hero(
            tag: model.img,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                model.img,
                fit: BoxFit.cover,
                height: context.height() / 6,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name, style: primaryTextStyle(color: Colors.red)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemModel {
  var name = "";
  var img = "";
}

List<ItemModel> getData() {
  List<ItemModel> popularArrayList = [];
  ItemModel item1 = ItemModel();
  item1.img = 'assets/images/ic_item3.jpg';
  item1.name = "Black Jacket";

  ItemModel item2 = ItemModel();
  item2.img = 'assets/images/ic_item1.jpg';
  item2.name = "Denim Jacket";

  ItemModel item3 = ItemModel();
  item3.img = 'assets/images/ic_item2.jpg';
  item3.name = "Blazer";

  ItemModel item4 = ItemModel();
  item4.img = 'assets/images/ic_item4.jpg';
  item4.name = "T-shirt";

  ItemModel item5 = ItemModel();
  item5.img = 'assets/images/ic_item5.jpg';
  item5.name = "Sunglasses";

  ItemModel item6 = ItemModel();
  item6.img = 'assets/images/ic_item6.jpg';
  item6.name = "Shirt";

  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);

  return popularArrayList;
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, this.name, this.image});

  final String? name;
  final String? image;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: widget.image!,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  child: Image.asset(
                    widget.image!,
                    fit: BoxFit.cover,
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              16.height,
              Text(widget.name!, style: boldTextStyle()).paddingOnly(left: 16),
              16.height,
              // Text(text, style: primaryTextStyle()).paddingAll(8)
            ],
          ),
        ),
      ),
    );
  }
}
