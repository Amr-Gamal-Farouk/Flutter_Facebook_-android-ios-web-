import 'package:facebook/models/user_model.dart';
import 'package:facebook/res/colors.dart';
import 'package:facebook/view/widgets/user_card.dart';
import 'package:flutter/material.dart';

import 'circle_button.dart';
import 'custom_tab_bar.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    Key? key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mWidth=MediaQuery.of(context).size.width;
    var mHeight=MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 50.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:    [
                const Icon(
                 Icons.facebook,
                  size: 40,
                  color: MyColors.facebookBlue,
                ),
                (mWidth>1250)?Container(
                  padding: const EdgeInsets.all(8),
                  width: 200 ,
                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      hintText: "Search Facebook",
                      filled: true,
                      fillColor: Color(0xfff0f2f5),
                    prefixIcon: Icon(Icons.search),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(20)),
                    //   borderSide: BorderSide(color: Colors.white,width: 0)
                    // ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.white,width: 0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.white,width: 0)
                      ),
                  ),),
                ): CircleButton(icon: Icons.search,
                iconSize: 20,
                onPressed: (){},),
                (mWidth>740)?const SizedBox(): Tooltip(
                  message: "More",
                  child: CircleButton(
                    icon: Icons.menu,
                    iconSize: 20.0,
                    onPressed: () => print('More'),
                  ),
                ),
              ],
            ),
          ),
          (mWidth>740)?SizedBox(
              height: double.infinity,
              width: mWidth*0.4,
              child: DefaultTabController(
                // Added
                length: 5, // Added
                initialIndex: 0, //
                child: CustomTabBar(
                  icons: icons,
                  selectedIndex: selectedIndex,
                  onTap: onTap,
                  isBottomIndicator: true,
                ),
              )):const SizedBox(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                (mWidth>1250)? UserCard(user: currentUser):const SizedBox(),
                const SizedBox(width: 12.0),
                Tooltip(
                  message: "Menu",
                  child: CircleButton(
                    icon: Icons.apps,
                    iconSize: 20.0,
                    onPressed: () => print('Menu'),
                  ),
                ), Tooltip(
                  message: "Messenger",
                  child: CircleButton(
                    icon: Icons.messenger,
                    iconSize: 20.0,
                    onPressed: () => print('Messenger'),
                  ),
                ), Tooltip(
                  message: "Notification",
                  child: CircleButton(
                    icon: Icons.notifications,
                    iconSize: 20.0,
                    onPressed: () => print('Notification'),
                  ),
                ), Tooltip(
                  message: "Account",
                  child: CircleButton(
                    icon: Icons.arrow_drop_down_outlined,
                    iconSize: 20.0,
                    onPressed: () => print('Account'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
