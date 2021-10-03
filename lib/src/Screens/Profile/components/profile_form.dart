import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project/src/Screens/Profile/components/profile_details.dart';
import 'package:new_project/src/Screens/Profile/components/profile_pic.dart';
import 'package:new_project/src/Screens/Profile/profile_screen.dart';
import 'package:new_project/src/graphql_config.dart';
import 'package:uuid/uuid.dart';

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

const editUser = """
mutation updateUser(\$id:String!,\$email: String!, \$username:String!,\$role:String!){
  updateUser(
    updateUserInput:{
    id:\$id
    email: \$email
    username: \$username
    role: \$role
  }
  ){
    __typename
    
  }
}
""";

class ProfileForm extends StatefulWidget {
  static const routerName = '/updateform';

  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  GraphqlConfig configuration = GraphqlConfig();
  // late final Person person;
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile!;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    checkPrefsForUser();
  }

  Widget build(BuildContext context) {
// TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
        ),
        body: AlertDialog(
          content: Container(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 110,
                      margin: EdgeInsets.only(left: 60),
                      child: ProfilePic(),
                    ),

                    // Container(
                    //     margin: EdgeInsets.all(10),
                    //     child: Tooltip(
                    //       message: 'Choose Image',
                    //       child: ElevatedButton(
                    //         onPressed: _pickImage,
                    //         child: Icon(
                    //           Icons.photo_library,
                    //           size: 30,
                    //         ),
                    //       ),
                    //     )),
                    Container(
                      padding: EdgeInsets.only(top: 150.0),
                      child: TextField(
                        maxLength: 40,
                        controller: usernameController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "Username",
                        ),
                      ),
                    ),
                    Divider(
                      height: 250,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 200.0),
                      child: TextField(
                        maxLength: 40,
                        controller: emailController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: "Email",
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(top: 180.0),
                    //   child: TextField(
                    //     obscureText: true,
                    //     maxLength: 40,
                    //     controller: passwordController,
                    //     decoration: InputDecoration(
                    //       icon: Icon(Icons.password),
                    //       labelText: "Password",
                    //     ),
                    //   ),
                    // ),
                    Container(
                      padding: EdgeInsets.only(top: 250.0),
                      child: TextField(
                        maxLength: 40,
                        controller: roleController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "Role",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            Mutation(
              options: MutationOptions(
                document: gql(editUser),
              ),
              builder: (RunMutation runMutation, QueryResult) {
                return ElevatedButton(
                    onPressed: () {
                      print(usernameController.text);
                      print(emailController.text);

                      runMutation({
                        'id': userId,
                        'email': emailController.text,
                        'username': usernameController.text,
                        'role': roleController.text,
                      });
                      Navigator.pushNamed(context, Profile.routerName);
                    },
                    child: const Text("Edit"));
              },
            ),
          ],
        ));
  }
}
