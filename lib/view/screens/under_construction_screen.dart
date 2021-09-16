import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnderConstruction extends StatefulWidget {
  final  String title;
  const UnderConstruction({Key? key,required this.title}) : super(key: key);

  @override
  _UnderConstructionState createState() => _UnderConstructionState();
}

class _UnderConstructionState extends State<UnderConstruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("${ widget.title}\nunder construction",
        textAlign: TextAlign.center,),),
    );
  }
}
