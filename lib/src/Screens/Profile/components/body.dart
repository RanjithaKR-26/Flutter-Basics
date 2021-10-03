import 'package:flutter/material.dart';
import 'package:new_project/src/Screens/Profile/components/profile_details.dart';
import 'package:new_project/src/Screens/Profile/components/profile_form.dart';
import 'package:new_project/src/Screens/Profile/components/profile_pic.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Column(
          children: <Widget>[
            // const ProfilePic(),
            const ProfileDetails(),
            const Padding(padding: EdgeInsets.only(top: 50.0)),
            ElevatedButton(
              child: const Text("Update Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600)),
              onPressed: () {
                // ignore: avoid_print
                print(" Button Clicked");
                Navigator.pushNamed(context, ProfileForm.routerName);
              },
            )
          ],
        ));
  }
}
