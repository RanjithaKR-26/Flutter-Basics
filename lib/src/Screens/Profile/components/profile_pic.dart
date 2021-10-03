import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:new_project/src/Screens/Profile/components/profile_form.dart';
import 'package:new_project/src/Screens/Profile/profile_screen.dart';
import 'package:new_project/src/Screens/products/components/product_details.dart';
import 'package:new_project/src/Screens/products/products_screens.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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

const editUser =
    """
mutation updateUser(\$id:String!,\$avatar: String!){
  updateUser(
    updateUserInput:{
    id:\$id
    avatar: \$avatar
  }
  ){
    __typename
    
  }
}
""";

// import 'package:flutter_svg/flutter_svg.dart';
class ProfilePic extends StatefulWidget {
  final test = "something print";
  const ProfilePic({Key? key}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  late PickedFile _imageFile;
  // final String uploadUrl = 'https://api.imgur.com/3/upload';
  final ImagePicker _picker = ImagePicker();

  Future<String?> uploadImage(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', filepath));
    var res = await request.send();
    return res.reasonPhrase;
  }

  Future<void> retriveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file!;
      });
    } else {
      print('Retrieve error ' + response.exception!.code);
    }
  }

  Widget _previewImage() {
    print(
      Image.file(File(_imageFile.path)),
    );
    if (_imageFile != null) {
      return SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.file(File(_imageFile.path)),
              SizedBox(
                height: 10,
              ),
              Mutation(
                options: MutationOptions(
                  document: gql(editUser),
                ),
                builder: (RunMutation runMutation, QueryResult) {
                  return ElevatedButton(
                      onPressed: () {
                        runMutation({'id': userId, 'avatar': _imageFile.path});
                        Navigator.pushNamed(context, Profile.routerName);
                      },
                      child: const Text("update"));
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

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
    return Scaffold(
      body: FutureBuilder<void>(
        future: retriveLostData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Text('Picked an image');
            case ConnectionState.done:
              return _previewImage();
            default:
              return const Text('Picked an image');
          }
        },
      ),
      floatingActionButton: Container(
          // width: 40,
          // height: 40,
          margin: EdgeInsets.only(left: 70, top: 80),
          child: FloatingActionButton(
              onPressed: _pickImage,
              tooltip: 'Pick Image from gallery',
              child: Icon(Icons.photo_library, size: 50, color: Colors.grey))),
      // This
      // trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
