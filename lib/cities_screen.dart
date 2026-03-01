import 'package:flutter/material.dart';
import 'city_card.dart';

class CitiesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text("Cities"),),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          padding: EdgeInsetsGeometry.all(10),
          children: [
            CityCard(name: "Lahore"),
            CityCard(name: "Islamabad"),
            CityCard(name: "Karachi"),
            CityCard(name: "Faisalabad"),
            CityCard(name: "Multan"),
            CityCard(name: "Abbottabad"),
            CityCard(name: "Hyderabad")
          ],
        )
    );
  }
}