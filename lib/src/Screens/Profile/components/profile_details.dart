import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:new_project/src/Screens/Login/login.dart';
import 'package:new_project/src/Screens/Profile/components/profile_pic.dart';
import 'package:new_project/src/Screens/Profile/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

var userId;
var auth;

checkPrefsForUser() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var _sharedToken = _prefs.getString('token');
  var sharedId = _prefs.getString('userId');
  userId = sharedId;
  auth = _sharedToken;
}

class ProfileDetails extends StatefulWidget {
  static const routerName = '/profileDetails';

  const ProfileDetails({Key? key}) : super(key: key);

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  var profileUserId;

  @override
  void initState() {
    super.initState();
    checkPrefsForUser();
  }

  Widget build(BuildContext context) {
    print(userId);

    return Container(
        padding: const EdgeInsets.all(2),
        child: Query(
            options: QueryOptions(document: gql("""
 query user(\$id:String!){
  user(id:\$id){
    email
    username
    avatar
    role
  }   
}
  """), variables: {'id': userId}, ),
            builder: (QueryResult result, {fetchMore, refetch}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }
              if (result.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final emailData = result.data!['user']['email'];
              final nameData = result.data!['user']['username'];
              final prifilePic = result.data!['user']['avatar'];
              final role = result.data!['user']['role'];
              print(prifilePic);
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          // Image.memory(prifilePic),
                          // Image.file(File(
                          //     "http://localhost:56481/5ac19b41-4b8e-41d9-afcb-1e31088a4404")),
                          // Image.asset(prifilePic),
                          // AssetImage(prifilePic),
                          // Image.network(
                          //     "http://localhost:56481/5ac19b41-4b8e-41d9-afcb-1e31088a4404"),
                          CircleAvatar(
                              backgroundImage: NetworkImage(prifilePic)),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                    Text(userId),
                    ListTile(
                      leading: Text(
                        "UserName :",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      title: Text(nameData,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800)),
                    ),
                    ListTile(
                        leading: Text("Email :",
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                        title: Text(emailData,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800))),
                    ListTile(
                        leading: Text("Role :",
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                        title: Text(role,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800))),
                  ],
                ),
              );
            }));
  }
}
