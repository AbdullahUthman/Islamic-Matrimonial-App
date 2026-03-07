import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abdullah/data/male_dummy_data.dart';
import 'package:abdullah/models/user.dart';

class ContactButton extends StatefulWidget{
  final User user;
  const ContactButton({required this.user});
  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Call feature coming soon..."),
              duration: Duration(seconds: 1),
            )
          );
        },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[600],
      ),
        child:  Row(
          children: [
            Icon(Icons.call, color: Colors.black,),
            Spacer(),
            widget.user.gender == Genders.male?
            Text("Call Wali", style: TextStyle(color: Colors.black)):
            Text("Call", style: TextStyle(color: Colors.black)),
          ],
        ),
    );
    }
}