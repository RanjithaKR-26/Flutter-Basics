import 'package:flutter/material.dart';
import 'package:new_project/src/Screens/group/AvtarCard.dart';
import 'package:new_project/src/Screens/group/ChatModel.dart';
import 'package:new_project/src/Screens/group/ContactCard.dart';
import 'package:new_project/src/Screens/group/addmember.dart';
import 'package:new_project/src/Screens/homepage.dart';
import 'package:new_project/src/widget/search.dart';

class CreateGroup extends StatefulWidget {
  static const routerName = "/creategroup";
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final String _groupName = 'Shop';

  List<ChatModel> contacts = [
    ChatModel(
        name: "Dev Stack",
        status: "A full stack developer",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Balram",
        status: "Flutter Developer...........",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Saket",
        status: "Web developer...",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Bhanu Dev",
        status: "App developer....",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Collins",
        status: "Raect developer..",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Kishor",
        status: "Full Stack Web",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Testing1",
        status: "Example work",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Testing2",
        status: "Sharing is caring",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Divyanshu",
        status: ".....",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Helper",
        status: "Love you Mom Dad",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
    ChatModel(
        name: "Tester",
        status: "I find the bugs",
        currentMessage: '',
        icon: '',
        id: 1,
        isGroup: true,
        time: ''),
  ];
  List<ChatModel> groupmember = [];

  void _popupDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget createButton = FlatButton(
      child: Text("Create"),
      onPressed: () async {
        if (_groupName != null) {
          Navigator.pushNamed(context, Homepage.routerName);
        }
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Create a group"),
      content: TextField(
          onChanged: (val) {
            // _groupName = val;
          },
          style: TextStyle(fontSize: 15.0, height: 2.0, color: Colors.black)),
      actions: [
        cancelButton,
        createButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "New Group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage()));
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF128C7E),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddMember(
                        membersList: [],
                      )));
            },
            child: Icon(Icons.arrow_forward)),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groupmember.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (contacts[index - 1].select == true) {
                          groupmember.remove(contacts[index - 1]);
                          contacts[index - 1].select = false;
                        } else {
                          groupmember.add(contacts[index - 1]);
                          contacts[index - 1].select = true;
                        }
                      });
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            groupmember.length > 0
                ? Align(
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true)
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupmember.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvatarCard(
                                      chatModel: contacts[index],
                                    ),
                                  );
                                return Container();
                              }),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  )
                : Container(),
          ],
        ));
  }
}
