import 'package:facebook/res/colors.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  final List<String> tapsName=["Home","Watch","Marketplace","Group","Gaming"];

   CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? const Border(
                bottom: BorderSide(
                  color: MyColors.facebookBlue,
                  width: 3.0,
                ),
              )
            : const Border(
                top: BorderSide(
                  color: MyColors.facebookBlue,
                  width: 3.0,
                ),
              ),
      ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tooltip(
                  message: tapsName[i],
                  child: Tab(
                    icon: Icon(
                      e,
                      color: i == selectedIndex
                          ? MyColors.facebookBlue
                          : Colors.black45,
                      size: 30.0,

                    ),
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
