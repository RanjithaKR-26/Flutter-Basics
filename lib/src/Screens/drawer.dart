import 'package:flutter/material.dart';
import 'package:new_project/src/Screens/Login/login.dart';
import 'package:new_project/src/Screens/Profile/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

var tokenRemove;
var idRemove;

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var reload = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // is_logged_in.value == true
              const ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Profil.png')),
                title: Text("Abhishek"),
                subtitle: Text("abhi@gmail.com"),
              ),
              const Divider(),
              ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/images/home.png",
                      height: 16,
                      color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Home',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Homepage(
                        value: '',
                      );
                    }));
                  }),

              ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/images/profile.png",
                      height: 16,
                      color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Profile',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    setState(() {
                      reload = true;
                      print(reload);
                    });
                    Navigator.pushNamed(context, Profile.routerName);
                  }),

              ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/images/order.png",
                      height: 16,
                      color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Orders',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return OrderList(from_checkout: false);
                    // }));
                  }),

              ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/images/chat.png",
                      height: 16,
                      color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Messages',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {}),

              ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/images/logout.png",
                      height: 16,
                      color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Logout',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    // onTapLogout(context);
                    remove() async {
                      SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                      var _removeId = _prefs.remove('userId');
                      var _removeToken = _prefs.remove('token');
                      idRemove = _removeId;
                      tokenRemove = _removeToken;
                    }

                    Navigator.pushNamed(context, loginScreen.routeName);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
