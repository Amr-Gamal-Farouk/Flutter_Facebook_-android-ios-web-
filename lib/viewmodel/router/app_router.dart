
import 'package:facebook/view/screens/app_view_screen.dart';
import 'package:facebook/viewmodel/router/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route  generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return  GeneratedPageRoute(routeName: settings.name!,
            widget: const AppViewScreen());
      // case RoutesName.secScreen:
      //   return  GeneratedPageRoute(routeName: settings.name!,
      //       widget: const SecScreen());
      default:
        return  GeneratedPageRoute(routeName: settings.name!,
            widget: const AppViewScreen());
    }
  }
}

class GeneratedPageRoute extends MaterialPageRoute{
  final Widget widget;
  final String routeName;

  GeneratedPageRoute({required this.widget, required this.routeName}):super(
      settings: RouteSettings(name: routeName),
      builder: (_)=>widget
     );





}

