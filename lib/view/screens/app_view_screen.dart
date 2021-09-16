import 'package:facebook/view/screens/desktop_home_screen.dart';
import 'package:facebook/viewmodel/posts/cubit.dart';
import 'package:facebook/viewmodel/user/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mobile_home_screen.dart';

class AppViewScreen extends StatefulWidget {
  const AppViewScreen({Key? key}) : super(key: key);

  @override
  State<AppViewScreen> createState() => _AppViewScreenState();
}

class _AppViewScreenState extends State<AppViewScreen> {

  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading=true;
    });
    BlocProvider.of<UserCubit>(context).getCurrentUser();
    BlocProvider.of<UserCubit>(context).getOnlineUser();
    BlocProvider.of<PostsCubit>(context).getPosts();
    BlocProvider.of<PostsCubit>(context).getStories();
    Future.delayed(const Duration(seconds: 2),(){
      setState(() {
        isLoading=false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    var mWidth=MediaQuery.of(context).size.width;
    var mHeight=MediaQuery.of(context).size.height;
    print(mWidth);

    return isLoading?const Scaffold(body: Center(child: CircularProgressIndicator(),),)
      :Material(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return const DesktopHomeScreen() ;
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return const DesktopHomeScreen();
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return MobileHomeScreen();
      }

      return Container(color:Colors.blueGrey);
    },
    ));

  }
}
