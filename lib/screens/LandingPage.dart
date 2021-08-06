import 'package:flutter/material.dart';
import 'package:travelnepal/customs/BorderIcon.dart';
import 'package:travelnepal/sample_data.dart';
import 'package:travelnepal/utils/constants.dart';
import 'package:travelnepal/utils/customs_function.dart';
import 'package:travelnepal/utils/widget_functions.dart';

class LandingPage extends StatelessWidget {
  final sidePadding = EdgeInsets.symmetric(horizontal: 25);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: sidePadding,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderIcon(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        ),
                      ),
                      BorderIcon(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.settings,
                          color: COLOR_BLACK,
                        ),
                      ),
                    ]),
              ),
              addVerticalSpace(25),
              Padding(
                padding: sidePadding,
                child: Text("Travel with us ",
                    style: themeData.textTheme.bodyText2),
              ),
              addVerticalSpace(25),
              Padding(
                padding: sidePadding,
                child: Text("Baglung ", style: themeData.textTheme.headline1),
              ),
              Padding(
                padding: sidePadding,
                child: Divider(
                  height: 25,
                  color: COLOR_GREY,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ["Foods", "Music", "Hospitality", "Culture"]
                      .map((filter) => ChoiceOption(
                            text: filter,
                          ))
                      .toList(),
                ),
              ),
              addVerticalSpace(10),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                      itemCount: RE_DATA.length,
                      itemBuilder: (context, index) {
                        return TravelItem(itemData: RE_DATA[index]);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String? text;

  ChoiceOption({this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 13,
      ),
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text!,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class TravelItem extends StatelessWidget {
  final dynamic itemData;

  const TravelItem({Key? key, @required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(height: 400, image: AssetImage(itemData["image"])),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: BorderIcon(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.favorite_border,
                    color: COLOR_BLACK,
                  ),
                ),
              ),
            ],
          ),
          addVerticalSpace(10),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${itemData["name"]}",
                  style: themeData.textTheme.headline5,
                ),
                addVerticalSpace(5),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            Text("${itemData["address"]}",
                                style: themeData.textTheme.bodyText1),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.green,
                        ),
                        Text("${itemData["Call"]}"),
                      ],
                    )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
