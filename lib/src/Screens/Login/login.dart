// // ignore_for_file: unnecessary_new

// // import 'dart:html' as html;
// import 'package:universal_html/html.dart' as html;

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:new_project/src/Screens/Login/otp.dart';

// class loginScreen extends StatefulWidget {
//   static const routerName = "/login";
//   @override
//   loginScreenState createState() => loginScreenState();
// }

// void login() {
//   html.window.location.href = "http://localhost:5001/google";
// }

// void facebook() {
//   html.window.location.href = "http://localhost:5001/facebook";
// }

// class _loginScreenState extends State<loginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SocialEcom'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             //  mainAxisAlignment:MainAxisAlignment.start,
//             children: <Widget>[
//               const SizedBox(
//                 height: 15.0,
//               ),
//               Image.asset(
//                 'assets/images/logo.png',
//                 width: 300,
//               ),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               const Text(
//                 'LOGIN',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               const Text(
//                 'Enter your mobile number to recieve a verification code',
//                 style: TextStyle(fontSize: 18),
//                 textAlign: TextAlign.center,
//               ),
//               Container(
//                   padding: const EdgeInsets.only(
//                       top: 10, bottom: 10.0, left: 40.0, right: 40.0),
//                   child: new Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       new TextField(
//                         decoration: const InputDecoration(
//                             labelText: "Enter your number"),
//                         keyboardType: TextInputType.number,
//                         inputFormatters: <TextInputFormatter>[
//                           FilteringTextInputFormatter.digitsOnly
//                         ], // Only numbers can be entered
//                       ),
//                     ],
//                   )),
//               RaisedButton(
//                 child: const Text(
//                   'SEND OTP',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 color: Colors.blueAccent,
//                 textColor: Colors.white,
//                 onPressed: () {
//                   Navigator.pushNamed(context, OtpVerify.routerName);
//                 },
//               ),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               const Text(
//                 'OR',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//               ),
//               const SizedBox(
//                 height: 15.0,
//               ),
//               SignInButton(Buttons.GoogleDark, onPressed: () {
//                 login();
//               }),
//               SignInButton(
//                 Buttons.FacebookNew,
//                 onPressed: () {
//                   facebook();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// NORMAL AUTHENTICATION HERE
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:new_project/src/Screens/Login/registration.dart';
import 'package:new_project/src/Screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const login = """
mutation login(\$email: String!, \$password: String!){
  login(
    login:{
    email: \$email
    password: \$password
  }
  ){
    token
    userId
  }
}
""";

void upDateSharedPreferences(String token, String userId) async {
  print(token);
  print(userId);
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString('token', token);
  await _prefs.setString('userId', userId);
}

checkPrefsForUser() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var _sharedToken = _prefs.getString('token');
  var _sharedId = _prefs.getString('userId');
  // print(_sharedId);
  // print(_sharedToken);
  userId = _sharedId;
  auth = _sharedToken;
}

var userId;
var auth;

class loginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('FLUTTER'),
        ),
        body: SingleChildScrollView(
          child: Form(
              // padding: const EdgeInsets.all(15),
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/flutter_logo.png',
                    height: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          suffixIcon: Icon(Icons.email)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter a password");
                        } else if (value.length < 8) {
                          return ("Password must be greater than 8 letters");
                        } else if (value.length >= 14) {
                          return ("Password must be less than 14 letters");
                        }
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          suffixIcon: Icon(Icons.password)),
                    ),
                  ),
                  // FlatButton(
                  //   onPressed: () {
                  //     //TODO FORGOT PASSWORD SCREEN GOES HERE
                  //   },
                  //   child: const Text(
                  //     'Forgot Password?',
                  //     style: TextStyle(color: Colors.blue, fontSize: 15),
                  //   ),
                  // ),
                  Mutation(
                    options: MutationOptions(
                      document: gql(login),
                    ),
                    builder: (runMutation, result) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            runMutation({
                              'email': emailController.text,
                              'password': passwordController.text,
                            });
        
                            setState(() {
                              // if (result?.data == null) {
                              //   return ;
                              // } 
                              // else {
                              //   var userId = result?.data!['login']['userId'];
                              //   var token = result?.data!['login']['token'];
                              //   upDateSharedPreferences(token, userId);
                              //   checkPrefsForUser();
                              // }
                              Navigator.pushNamed(context, Homepage.routerName);
                            });
                          }
                        },
                        child: const Text("Log In"),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 80,
                  ),
                  const Text('New User?'),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, registrationScreen.routeName);
                    },
                    child: const Text(
                      'Create account',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              )),
        ));
  }
}
