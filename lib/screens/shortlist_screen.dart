import 'package:abdullah/data/male_dummy_data.dart';
import 'package:abdullah/main.dart';
import 'package:flutter/material.dart';
import 'package:abdullah/models/profile.dart';
import 'package:abdullah/data/female_dummy_data.dart';
import 'package:abdullah/widgets/profile_card.dart';
import 'package:abdullah/screens/profile_screen.dart';
import 'package:abdullah/models/user.dart';

class ShortlistScreen extends StatefulWidget{
  final User user;
  ShortlistScreen({required this.user});

  @override
  State<ShortlistScreen> createState() => _ShortListScreenState();
}

class _ShortListScreenState extends State<ShortlistScreen> {
  late List<Profile> profiles;
  @override
  void initState() {
    super.initState();
    profiles = widget.user.gender == Genders.male
        ? dummyFemaleProfiles.where((p) => p.isShortListed).toList()
        : dummyMaleProfiles.where((p) => p.isShortListed).toList();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: profiles.isEmpty?
      Center(
        child:  Text("This is empty", style: TextStyle(color: Colors.black)),
      ):
      ListView.builder(itemCount: profiles.length, itemBuilder: (context, index) {
        return InkWell(
          onTap:  () async{
             await Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(id: profiles[index].id, user: widget.user)));
             setState(() {
             });
          },
          child: Dismissible(
            key: ObjectKey(profiles[index].id),
            background: Container(
              color: kColorScheme.error,
            ),
            onDismissed: (direction) {
              final Profile _deletedProfile = profiles[index];
              setState(() {
                profiles[index].isShortListed = false;
                profiles.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Profile removed from shortlist"),
                        duration: Duration(seconds: 3),
                  action: SnackBarAction(label: "Undo", onPressed: (){
                    setState(() {
                      profiles.insert(index, _deletedProfile);
                      profiles[index].isShortListed = true;
                    });
                  }),
                )
              );
            },
            child: ProfileCard(
              user: widget.user,
              profile: profiles[index],
            ),
          ),
        );
      },),
    );
  }
}