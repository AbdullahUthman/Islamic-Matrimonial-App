import 'package:abdullah/screens/profiles_screen.dart';
import 'package:flutter/material.dart';
import '../screens/profiles_screen.dart';

class CityCard extends StatelessWidget{
  final String name;
  final Color color;
  void Function(String city) onSwitch;
   CityCard({required this.name, required this.color, required this.onSwitch});

  @override
  Widget build(BuildContext context){
    return Center(
        child: Container(
        width: 140,
        height: 140,
        child: InkWell(
          onTap: (){
            onSwitch(name);
          },
            child: Card(
            elevation: 3,
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Center(
              child:  Text(name),
            )
        )
    )
        )
    );
  }
}