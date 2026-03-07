import 'package:abdullah/data/male_dummy_data.dart';
import 'package:abdullah/models/profile.dart';
import 'package:abdullah/widgets/shortlist_button.dart';
import 'package:flutter/material.dart';
import '../data/female_dummy_data.dart';
import 'package:abdullah/main.dart';
import 'package:abdullah/widgets/contact_button.dart';
import 'package:abdullah/models/user.dart';

class ProfileScreen extends StatelessWidget{
  final User user;
  final String id;
  const ProfileScreen({required this.id, required this.user});

  @override
  Widget build(BuildContext context) {
    final  profile =  user.gender == Genders.male?  dummyFemaleProfiles.firstWhere((P)=> P.id == id): dummyMaleProfiles.firstWhere((P) => P.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text("${profile.name.split(' ')[0]}'s Profile")
      ),
        body: SafeArea(
          child: ListView(
      children:[

        Image.asset(
          profile.imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) =>
          user.gender == Genders.male?
              Image.asset('assets/female-profile.png'):
              Image.asset('assets/male-profile.png')
        ),
        Text(profile.name, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
        Row(
          children: [
            Text("${profile.age},",style: TextStyle(fontSize: 21)),
            SizedBox(width: 10,),
            Text(profile.city, style: TextStyle(fontSize: 21)),

          ],
        ),
              if(user.gender == Genders.female)
                Text("Occupation: ${profile.occupation!}", style: TextStyle(fontSize: 19),),

              Text("Marital Status: ${profile.status.name.enumToString()}", style: TextStyle(fontSize: 19),),
              if(profile.hasChildren)
                Text("(Has Children)",style: TextStyle(fontSize: 19),),
        SizedBox(
          height: 20,
        ),
        Text("Hobbies", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:Row(
            children: [
              for(var hobby in user.gender == Genders.male? dummyFemaleProfiles.firstWhere((P)=>P.id == id).hobbies: dummyMaleProfiles.firstWhere((P)=>P.id == id).hobbies)
                Container(
                  width: 120,
                  child: Card(
                    color: kColorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
    child: Text(hobby.name.enumToString(), style: TextStyle(color: kColorScheme.onSecondary, fontSize: 15),),
    )
                  ),
                )
                ,
              SizedBox(
                width: 10,
              )
            ],
          )
        ),
        SizedBox(
          height: 20,
        ),
        Text("Traits", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:Row(
              children: [
                for(var trait in user.gender == Genders.male? dummyFemaleProfiles.firstWhere((P)=>P.id == id).traits: dummyMaleProfiles.firstWhere((P)=>P.id == id).traits)
                  Container(
                    width: 120,
                    child: Card(
                        color: kColorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(trait.name.enumToString(), style: TextStyle(color: kColorScheme.onSecondary, fontSize: 15),),
                        )
                    ),
                  )
                ,
                SizedBox(
                  width: 10,
                )
              ],
            )
        ),
        SizedBox(
          height: 20,
        ),
        Text("About Me", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
        Text(profile.description, style: TextStyle(fontSize: 16),),
        SizedBox(height: 75,),
        ShortlistButton(userID: profile.id, user: user),
        ContactButton(user: user),
      ],
    )
        )
    );
  }

}