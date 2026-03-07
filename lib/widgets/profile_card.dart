import 'package:flutter/material.dart';
import '../data/female_dummy_data.dart';
import 'package:matrimonial_app/models/profile.dart';
import 'package:matrimonial_app/models/user.dart';
import 'package:matrimonial_app/data/male_dummy_data.dart';
import 'package:matrimonial_app/models/user.dart';

class ProfileCard extends StatelessWidget{
  final Profile profile;
  final User user;
  const ProfileCard({required this.profile, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          FadeInImage(
            height: 200,
              width: double.infinity,
              placeholder: user.gender == Genders.male? AssetImage("assets/female-profile.png") : AssetImage("assets/male-profile.png"),
              image: AssetImage(profile.imageUrl),
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
                return  user.gender == Genders.male? Image.asset("assets/female-profile.png", fit: BoxFit.cover, alignment: Alignment.center, height: 200, width: double.infinity,): Image.asset("assets/male-profile.png", fit: BoxFit.cover, alignment: Alignment.center, height: 200, width: double.infinity,);
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              height: user.gender == Genders.male? 70: 90,     //to set the height appropriately so that the occupation field can fill for the maile profiles
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("Name: ${profile.name}", style: TextStyle(color: Colors.white, fontSize: 15)),
                      Spacer(),
                      Text("Age: ${profile.age}"  ,style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  if(user.gender == Genders.female)
                    Row(
                      children: [
                        Text(profile.occupation!, style: TextStyle(color: Colors.white, fontSize: 15),),
                      ],
                    ),
                  Row(
                    children: [
                      Flexible(
                        child:
                          Text("Marital Status: ${profile.status.name.enumToString()}",  style: TextStyle(color: Colors.white, fontSize: 15,),)
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.call, color: Colors.white,),
                      SizedBox(width: 10,),
                      user.gender == Genders.male?
                      Text("Wali's Number: ${profile.contact}", style: TextStyle(color: Colors.white, fontSize: 15)):
                      Text("Contact Number: ${profile.contact}", style: TextStyle(color: Colors.white, fontSize: 15))
                    ],
                  ),

                ],
              ),
          )
          ),
        ]
      ),
    );
  }
}