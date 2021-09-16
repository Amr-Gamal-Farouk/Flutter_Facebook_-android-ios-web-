import 'package:facebook/res/theme.dart';
import 'package:facebook/view/screens/app_view_screen.dart';
import 'package:facebook/viewmodel/posts/cubit.dart';
import 'package:facebook/viewmodel/router/app_router.dart';
import 'package:facebook/viewmodel/router/routes_name.dart';
import 'package:facebook/viewmodel/user/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData  myTheme = appTheme;

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider.value(value: UserCubit()),
        BlocProvider.value(value: PostsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter task',
        theme: myTheme,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: RoutesName.appViewScreen,
      ),
    );
  }
}


