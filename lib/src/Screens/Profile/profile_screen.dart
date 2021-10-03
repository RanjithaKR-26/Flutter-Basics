import 'package:flutter/material.dart';
import 'package:new_project/src/Screens/Profile/components/body.dart';

class Profile extends StatelessWidget {
  static const routerName = "/profile";
  
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: const Body(),
    );
  }
}
