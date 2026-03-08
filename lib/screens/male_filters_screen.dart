import 'package:flutter/material.dart';
import 'package:matrimonial_app/models/profile.dart';
import 'package:matrimonial_app/models/filter.dart';
import 'package:matrimonial_app/widgets/age_slider.dart';
import 'package:matrimonial_app/models/city.dart';
import 'package:matrimonial_app/models/user.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({required this.user});
  final User user;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  late Map<Enum, bool> _selectedStatuses;
  final Map<cityNames, bool>_selectedCities = {
  cityNames.lahore: true,
  cityNames.islamabad: true,
  cityNames.karachi: true,
  cityNames.faisalabad: true,
  cityNames.multan: true,
  cityNames.abbottabad: true,
  cityNames.hyderabad: true,
  cityNames.peshawar: true,
  };

  final Map<String, bool> _childrenFilter = {
    'hasChildren': true,
    'noChildren': true,
  };

  void _dealWithInvalidChildrenFilter(){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cannot set both to false"),
          duration: Duration(seconds: 1),
        )
    );
  }

  late RangeValues range;

  @override
  void initState(){
    super.initState();
    range =  widget.user.gender == Genders.male? RangeValues(16, 30):  RangeValues(18, 30); // age range 16-30 for female profiles and 18-40 for male profiles
    _selectedStatuses = widget.user.gender == Genders.female? {
      MaleMaritalStatus.neverMarried: true,
      MaleMaritalStatus.previouslyMarried: true,
      MaleMaritalStatus.secondMarriage: true,
      MaleMaritalStatus.thirdMarriage: true,
      MaleMaritalStatus.fourthMarriage: true
    } :
    {
      FemaleMaritalStatus.virgin: true,
      FemaleMaritalStatus.divorcee: true,
      FemaleMaritalStatus.widowed: true,
      FemaleMaritalStatus.nonVirgin: true,
    };

  }

  @override
  Widget build(BuildContext context) {
    bool _onlyVirginsSelected = widget.user.gender == Genders.male? (_selectedStatuses[MaleMaritalStatus
        .neverMarried] == true &&
        _selectedStatuses[MaleMaritalStatus.secondMarriage] == false &&
        _selectedStatuses[MaleMaritalStatus.thirdMarriage] == false &&
        _selectedStatuses[MaleMaritalStatus.fourthMarriage] == false &&
        _selectedStatuses[MaleMaritalStatus.previouslyMarried] == false):
    (
        _selectedStatuses[FemaleMaritalStatus.virgin] == true
            && _selectedStatuses[FemaleMaritalStatus.nonVirgin] == false
            && _selectedStatuses[FemaleMaritalStatus.divorcee] == false
            && _selectedStatuses[FemaleMaritalStatus.widowed] == false);

    if (_onlyVirginsSelected) {
      _childrenFilter["hasChildren"] = false;
      _childrenFilter["noChildren"] = true;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Filters"),),
      body: ListView(
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
                child: AgeSlider(onRangeChanged: (newRange) {
                  setState(() {
                    range = newRange;
                  });
                }, first: 18, last: 40),
              )
            ],
          ),
          Divider(),
          Text("Cities: ", style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold

          )),

         //cities
         for(var city in cities)
           CheckboxListTile(
             value: _selectedCities[city.name],
             onChanged: (value) {
               setState(() {
                 _selectedCities[city.name] = value!;
               });
             },
             title: Text(city.name.name.enumToString()),
           ),
          Divider(),
          //marital status
          Text("Marital Status: ", style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold
          )),

          for(var status in _selectedStatuses.keys)
          CheckboxListTile(
            value: _selectedStatuses[status],
            onChanged: (value) {
              setState(() {
                _selectedStatuses[status] = value!;
              });
            },
            title: Text(status.name.enumToString()),
          ),

          Divider(),
          //children
          Text("Children: ", style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold
          )),
          CheckboxListTile(
            enabled: !_onlyVirginsSelected,
            value: _childrenFilter["hasChildren"],
            onChanged: (value) {
              setState(() {
                if ((_childrenFilter["noChildren"] == false) &&
                    (value == false)) {
                  _dealWithInvalidChildrenFilter();
                  return;
                }
                _childrenFilter["hasChildren"] = value!;
              });
            },
            title: Text("Have Children"),
          ),
          CheckboxListTile(
            enabled: !_onlyVirginsSelected,
            value: _childrenFilter["noChildren"],
            onChanged: (value) {
              setState(() {
                if ((_childrenFilter["hasChildren"] == false) &&
                    (value == false)) {
                  _dealWithInvalidChildrenFilter();
                  return;
                }
                _childrenFilter["noChildren"] = value!;
              });
            },
            title: Text("Don't have Children"),
          ),
          Divider(),
          ElevatedButton(
              onPressed: () {
                Filter filters = Filter(
                  range: range,
                  children: _childrenFilter,
                  status: _selectedStatuses.map((key, value) => MapEntry(key, value)),
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
