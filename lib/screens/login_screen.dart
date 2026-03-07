import 'package:abdullah/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abdullah/models/user.dart';
import 'package:abdullah/screens/main_screen.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child:
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Welcome to Islamic Matrimonial App!", style: GoogleFonts.inspiration(fontSize: 65, color: kColorScheme.primary), softWrap: true, textAlign: TextAlign.center,),
                          Text("Select Your gender", style: TextStyle(fontSize: 18),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton
                                (
                                onPressed: (){
                                  User user = User(gender: Genders.male);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(user: user)));
                                },
                                child: Text("Male"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                  )
                                )
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              ElevatedButton
                                (
                                  onPressed: (){
                                    User user = User(gender: Genders.female);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(user: user,)));
                                  },
                                  child: Text("Female"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pinkAccent,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12))
                                      )
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                ),
              ],
            )
        )
      );
  }
}