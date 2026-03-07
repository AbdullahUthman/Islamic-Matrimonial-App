import 'package:matrimonial_app/data/male_dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrimonial_app/data/female_dummy_data.dart';
import 'package:matrimonial_app/models/profile.dart';
import 'package:matrimonial_app/models/user.dart';

class ShortlistButton extends StatefulWidget {
  final String userID;
  final User user;
  const ShortlistButton({required this.userID, required this.user});
  @override
  State<ShortlistButton> createState() => _ShortlistButtonState();
}

class _ShortlistButtonState extends State<ShortlistButton> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.user.gender == Genders.male? dummyFemaleProfiles.firstWhere((P)=> P.id == widget.userID) : dummyMaleProfiles.firstWhere((P)=> P.id == widget.userID);
    print('Building ShortlistButton, isShortListed: ${profile.isShortListed}');
    String text = profile.isShortListed?  "Remove from Shortlist": "Add to Shortlist" ;
    Icon icon = profile.isShortListed?  Icon(Icons.favorite) : Icon(Icons.favorite_outline);

    return ElevatedButton(
      onPressed: (){
        print('Before toggle: ${profile.isShortListed}');
        if(!profile.isShortListed) {
          setState(() {
            profile.isShortListed = true;
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Profile added to shortlist"),
                  duration: Duration(seconds: 1),
                )
            );
          });
        }
        else{
          setState(() {
            profile.isShortListed = false;
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Profile removed from shortlist"),
                  duration: Duration(seconds: 1),
                )
            );
          });
        }
        print('After toggle: ${profile.isShortListed}');
      },
      child: Row(
        children: [
          icon,
          Spacer(),
          Text(text),
        ],
      ),
    );
  }
}