import 'package:matrimonial_app/screens/profiles_screen.dart';
import 'package:matrimonial_app/screens/shortlist_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/city_card.dart';
import 'package:matrimonial_app/models/filter.dart';
import 'package:matrimonial_app/models/user.dart';


class CitiesScreen extends StatelessWidget {
  Filter? filters;
  final User user;
  CitiesScreen({this.filters, required this.user});
  @override
  Widget build(BuildContext context){
    final bool filtersApplied = filters!= null;
    List<String> cityNames = ["Lahore", "Islamabad", "Karachi", "Faisalabad", "Multan", "Abbottabad", "Hyderabad", "Peshawar"];
    List<Color> cityColors = [Colors.red, Colors.amber, Colors.greenAccent, Colors.blueAccent, Colors.orange, Colors.purpleAccent, Colors.teal, Colors.yellowAccent];

     void switchScreen(String city){
         Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilesScreen(selectedCity: city, filters: filters, user: user)));
    }

    return SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          padding: EdgeInsetsGeometry.all(10),
          children: [
            for(var cityName in cityNames)
              if(!filtersApplied || filtersApplied && filters!.cities[cityName]!)
                CityCard(name: cityName, color: cityColors[cityNames.indexOf(cityName)], onSwitch: switchScreen,),
  ]
    ),

    );
  }
}