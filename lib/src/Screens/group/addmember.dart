import 'package:flutter/material.dart';
import 'package:new_project/src/Screens/homepage.dart';
import 'package:new_project/src/graphql_config.dart';
import 'package:uuid/uuid.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const creategroup = """
mutation createGroup(\$name: String!, \$type: String!){
  createGroup(createGroupInput:{
    name: \$name
   type: \$type
    createruserId:"482ceb10-49d1-49d7-b0e1-b8e8698787cc"
  }){
    __typename
    
  }
}
""";

class AddMember extends StatefulWidget {
  static var routerName = '/addmember';
  final List<Map<String, dynamic>> membersList;
  const AddMember({required this.membersList, Key? key}) : super(key: key);

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  TextEditingController name = TextEditingController();
  TextEditingController type = TextEditingController();
  GraphqlConfig configuration = GraphqlConfig();

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  void createGroup() async {
    setState(() {
      isLoading = true;
    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (_) => const Homepage(
                  value: '',
                )),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Create Group"),
        ),
        body: AlertDialog(
          title: Text("Create"),
          content: Container(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: TextField(
                        maxLength: 40,
                        controller: name,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "Group Name",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 120.0),
                      child: TextField(
                        maxLength: 40,
                        controller: type,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: "Group Type",
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
              options: MutationOptions(document: gql(creategroup)),
              builder: (RunMutation runMutation, QueryResult) {
                return ElevatedButton(
                    onPressed: () {
                      print(name.text);
                      print(type.text);

                      runMutation({
                        'name': name.text,
                        'type': type.text,
                      });
                      Navigator.pushNamed(context, Homepage.routerName);
                    },
                    child: const Text("Create"));
              },
            ),
          ],
        ));
  }
}
