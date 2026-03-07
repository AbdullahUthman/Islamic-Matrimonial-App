import 'package:matrimonial_app/data/male_dummy_data.dart';
import 'package:flutter/material.dart';
import '../data/female_dummy_data.dart';
import '../widgets/profile_card.dart';
import 'profile_screen.dart';
import 'package:matrimonial_app/models/profile.dart';
import 'package:matrimonial_app/models/filter.dart';
import 'package:matrimonial_app/models/user.dart';
import 'package:matrimonial_app/data/male_dummy_data.dart';



class ProfilesScreen extends StatelessWidget{
  final String selectedCity;
  Filter? filters;
  final User user;
  ProfilesScreen({required this.selectedCity, this.filters, required this.user});
  @override
  Widget build(BuildContext context) {
    final  bool filtersApplied = filters != null;
    final List<Profile> profiles =
    user.gender == Genders.male?
    //user is male
    filtersApplied?
    //filters not null (male user)
    dummyFemaleProfiles.where((p) =>
    p.city == selectedCity &&
        (p.age >= filters!.range.start && p.age <= filters!.range.end) &&
        (filters!.status[p.status as FemaleMaritalStatus]!) &&
        (
            (p.hasChildren && filters!.children["hasChildren"]!) ||
                (!p.hasChildren && filters!.children["noChildren"]!)
        )
    ).toList()
    //filter null (male user)
        : dummyFemaleProfiles.where((P) => P.city == selectedCity).toList():

    //user is female
    filtersApplied?
    //filters is not null (female user)
    dummyMaleProfiles.where((p) =>
    p.city == selectedCity &&
        (p.age >= filters!.range.start && p.age <= filters!.range.end) &&
        (filters!.status[p.status as MaleMaritalStatus]!) &&
        (
            (p.hasChildren && filters!.children["hasChildren"]!) ||
                (!p.hasChildren && filters!.children["noChildren"]!)
        )
    ).toList()
        :
    //filters is null (female user)
    dummyMaleProfiles.where((P) => P.city == selectedCity).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Profiles"),),
      body: profiles.isEmpty?
      Center(
        child:  Text("This is empty", style: TextStyle(color: Colors.black)),
      ):
      ListView.builder(itemCount: profiles.length, itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(id: profiles[index].id, user: user,)));
          },
          child: ProfileCard(
            user: user,
            profile: profiles[index],
          ),
        );
      },),
    );
  }
}