import 'package:flutter/material.dart';

class CityCard extends StatelessWidget{
  final String name;
  const CityCard({required this.name});

  @override
  Widget build(BuildContext context){
    return Container(
        width: 50,
        height: 50,
        child: Card(
            elevation: 3,
            child: Center(
              child:  Text(name),
            )
        )
    );
  }
}