import 'package:abdullah/screens/cities_screen.dart';
import 'package:abdullah/screens/main_screen.dart';
import 'package:abdullah/widgets/age_slider.dart';
import 'package:flutter/material.dart';
import 'package:abdullah/models/profile.dart';
import 'package:abdullah/models/user.dart';
import 'package:abdullah/models/filter.dart';

class FemaleFiltersScreen extends StatefulWidget{
  @override
  State<FemaleFiltersScreen> createState() => _FemaleFiltersScreenState();
}

class _FemaleFiltersScreenState extends State<FemaleFiltersScreen> {
  final Map<String, bool> _selectedCities = {
    'Lahore': true,
    'Islamabad': true,
    'Karachi': true,
    'Faisalabad': true,
    'Multan': true,
    'Abbottabad': true,
    'Hyderabad': true,
    'Peshawar': true,
  };

  final Map<FemaleMaritalStatus, bool> _selectedStatuses = {
    FemaleMaritalStatus.virgin: true,
    FemaleMaritalStatus.divorcee: true,
    FemaleMaritalStatus.widowed: true,
    FemaleMaritalStatus.nonVirgin: true,
  };

  final Map<String, bool> _childrenFilter = {
    'hasChildren': true,
    'noChildren': true,
  };


  RangeValues range = RangeValues(16, 30);


  @override
  Widget build(BuildContext context) {
    bool _onlyVirginsSelected = (_selectedStatuses[FemaleMaritalStatus.virgin] == true && _selectedStatuses[FemaleMaritalStatus.nonVirgin] == false && _selectedStatuses[FemaleMaritalStatus.divorcee] == false && _selectedStatuses[FemaleMaritalStatus.widowed] == false);
    if(_onlyVirginsSelected){
      _childrenFilter["hasChildren"] = false;
      _childrenFilter["noChildren"] = true;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Filters"),),
      body:  ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                      "Age Range:",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold

                      )
                  ),
                ),

                Expanded(
                    child: AgeSlider(onRangeChanged: (newRange){
                      setState(() {
                        range = newRange;
                      });
                    }, first: 16, last: 30),
                )
              ],
            ),
            Divider(),
            Text("Cities: ", style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold

            )),
            CheckboxListTile(
              value: _selectedCities["Abbottabad"],
              onChanged: (value){
                setState(() {
                  _selectedCities["Abbottabad"] = value!;
                });
              },
              title: Text("Abbottabad"),
            ),
            CheckboxListTile(
              value: _selectedCities["Faisalabad"],
              onChanged: (value){
                setState(() {
                  _selectedCities["Faisalabad"] = value!;
                });
              },
              title: Text("Faisalabad"),
            ),
            CheckboxListTile(
              value: _selectedCities["Hyderabad"],
              onChanged: (value){
                setState(() {
                  _selectedCities["Hyderabad"] = value!;
                });
              },
              title: Text("Hyderabad"),
            ),
            CheckboxListTile(
              value: _selectedCities["Islamabad"],
              onChanged: (value){
                setState(() {
                  _selectedCities["Islamabad"] = value!;
                });
              },
              title: Text("Islamabad"),
            ),
            CheckboxListTile(
              value: _selectedCities["Karachi"],
              onChanged: (value){
                setState(() {
                  _selectedCities["Karachi"] = value!;
                });
              },
              title: Text("Karachi"),
            ),
            CheckboxListTile(
              value: _selectedCities["Lahore"],
              onChanged: (value){
                setState(() {
                  _selectedCities["Lahore"] = value!;
                });
              },
              title: Text("Lahore"),
            ),
            CheckboxListTile(
              value: _selectedCities["Multan"],
              onChanged: (value) {
                setState(() {
                  _selectedCities["Multan"] = value!;
                });
              },
              title: Text("Multan"),
            ),
            CheckboxListTile(
              value: _selectedCities["Peshawar"],
              onChanged: (value){
                setState(() {
                  _selectedCities["Peshawar"] = value!;
                });
              },
              title: Text("Peshawar"),
            ),
            Divider(),
            Text("Marital Status: ", style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold
            )),
            CheckboxListTile(
                value: _selectedStatuses[FemaleMaritalStatus.virgin],
                onChanged: (value){
                  setState(() {
                    _selectedStatuses[FemaleMaritalStatus.virgin] = value!;
                  });
                },
              title: Text("Virgins"),
            ),
            CheckboxListTile(
              value:  _selectedStatuses[FemaleMaritalStatus.divorcee],
              onChanged: (value){
                setState(() {
                  _selectedStatuses[FemaleMaritalStatus.divorcee] = value!;
                });
              },
              title: Text("Divorcees"),
            ),
            CheckboxListTile(
              value: _selectedStatuses[FemaleMaritalStatus.widowed],
              onChanged: (value){
                setState(() {
                  _selectedStatuses[FemaleMaritalStatus.widowed] = value!;
                });
              },
              title: Text("Widows"),
            ),
            CheckboxListTile(
              value:  _selectedStatuses[FemaleMaritalStatus.nonVirgin],
              onChanged: (value){
                setState(() {
                  _selectedStatuses[FemaleMaritalStatus.nonVirgin] = value!;
                });
              },
              title: Text("Non-virgins"),
            ),
            Divider(),
            Text("Children: ", style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold
            )),
            CheckboxListTile(
              enabled: !_onlyVirginsSelected,
              value:   _childrenFilter["hasChildren"],
              onChanged: (value){
                setState(() {
                  if((_childrenFilter["noChildren"] == false) && (value == false)){
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Cannot set both to false"),
                          duration: Duration(seconds: 1),
                        )
                    );
                    return;
                  }
                  _childrenFilter["hasChildren"] = value!;
                });
              },
              title: Text("Have Children"),
            ),
            CheckboxListTile(
              enabled: !_onlyVirginsSelected,
              value:  _childrenFilter["noChildren"],
              onChanged: (value){
                setState(() {
                  if((_childrenFilter["hasChildren"] == false) && (value == false)){
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Cannot set both to false"),
                        duration: Duration(seconds: 1),
                      )
                    );
                    return;
                  }
                  _childrenFilter["noChildren"] = value!;
                });
              },
              title: Text("Don't have Children"),
            ),
            Divider(),
            ElevatedButton(
                onPressed: (){
                  Filter filters = Filter(
                    range: range,
                    children: _childrenFilter,
                    status: _selectedStatuses.map((key, value) => MapEntry(key as Enum, value)),
                    cities: _selectedCities,
                  );
                  Navigator.of(context).pop(filters);
                },
                child: Text("Apply Filters"))
          ],
        ),
    );
  }
}