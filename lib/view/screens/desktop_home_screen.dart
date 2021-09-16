import 'package:facebook/view/screens/under_construction_screen.dart';
import 'package:facebook/view/widgets/custom_app_bar.dart';
import 'package:facebook/view/widgets/desktop_body.dart';
import 'package:facebook/viewmodel/data_sources/local_data.dart';
import 'package:facebook/viewmodel/user/cubit.dart';
import 'package:facebook/viewmodel/user/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({Key? key}) : super(key: key);

  @override
  _DesktopHomeScreenState createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> {
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront,
    Icons.group,
    Icons.videogame_asset_outlined,
  ];

  final List<Widget> _screens = [
    DesktopBody(scrollController: TrackingScrollController()),
    const UnderConstruction(title: "Watch"),
    const UnderConstruction(title: "Marketplace"),
    const UnderConstruction(title: "Group"),
    const UnderConstruction(title: "Gaming"),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width;
    var mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(mWidth, 60.0),
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return CustomAppBar(
              currentUser: state.currentUser,
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
            );
          },
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
    );
  }
}
