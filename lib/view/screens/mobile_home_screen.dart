import 'package:facebook/res/colors.dart';
import 'package:facebook/view/screens/under_construction_screen.dart';
import 'package:facebook/view/widgets/circle_button.dart';
import 'package:facebook/view/widgets/mobile_body.dart';
import 'package:flutter/material.dart';


class MobileHomeScreen extends StatefulWidget {
  @override
  _MobileHomeScreenState createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {

  List<Widget> appTaps=[
    const Tab(icon: Icon(Icons.home,)),
    const Tab(icon: Icon(Icons.group)),
    const Tab(icon: Icon(Icons.ondemand_video)),
    const Tab(icon: Icon(Icons.storefront)),
    const Tab(icon: Icon(Icons.notifications)),
    const Tab(icon: Icon(Icons.menu)),

  ];
  int _selectedIndex=0;

  final List<Widget> _screens = [
    const MobileBody(),
    const UnderConstruction(title: "Group"),
    const UnderConstruction(title: "Watch"),
    const UnderConstruction(title: "Marketplace"),
    const UnderConstruction(title: "Notification"),
    const UnderConstruction(title: "More"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                actions: [
                  CircleButton(
                    icon: Icons.search,
                    iconSize: 20.0,
                    onPressed: () => print('search'),
                  ),
                  CircleButton(
                    icon: Icons.messenger,
                    iconSize: 20.0,
                    onPressed: () => print('messenger'),
                  ),

                ],
                title: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Facebook",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.facebookBlue,
                  ),),
                ),

                floating: true,
                pinned: false,
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: MyColors.facebookBlue,
                    tabs: appTaps,
                    onTap: (index) => setState(() => _selectedIndex = index),
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body:  TabBarView(
            children: _screens,
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}