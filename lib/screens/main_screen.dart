import 'package:abdullah/screens/cities_screen.dart';
import 'package:abdullah/screens/female_filters_screen.dart';
import 'package:abdullah/screens/login_screen.dart';
import 'package:abdullah/screens/male_filters_screen.dart';
import 'package:abdullah/screens/shortlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:abdullah/models/filter.dart';
import 'package:abdullah/models/user.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({required this.user});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Filter? filter;
  int _selectedIndex = 0;
   List<String> _screenTitles = ["Cities", "ShortList"];
  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [CitiesScreen(filters: filter, user: widget.user),ShortlistScreen(user: widget.user)];
    return Scaffold(
      appBar: AppBar(title: Text(_screenTitles[_selectedIndex]),),
      body:  _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(widget.user.gender == Genders.male? Icons.person_3_outlined: Icons.person_outline),
              activeIcon: Icon(widget.user.gender == Genders.male? Icons.person_3: Icons.person),
              label: "Profiles",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: "Shortlist",
            ),
          ]),
      drawer: SafeArea(
        child: SizedBox(
          width: 180,
          child: Drawer(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(widget.user.gender == Genders.male? Icons.person_3: Icons.person),
                    title: Text("Profiles"),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Filters"),
                    onTap: () async{
                      Navigator.pop(context);
                      final Filter? result = widget.user.gender == Genders.male? await
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> FemaleFiltersScreen())
                      ):
                          await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> MaleFiltersScreen())
                          );
                      if(result != null){
                        setState(() {
                          filter = result;
                        });
                      }
                    },
                  ),
                  Spacer(),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Logout"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                      }
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}