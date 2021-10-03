import 'package:flutter/material.dart';
import 'package:new_project/src/Screens/drawer.dart';
import 'package:new_project/src/Screens/group/creategroup.dart';
import 'package:new_project/src/widget/grouplist.dart';
import 'package:new_project/src/widget/search.dart';

class Homepage extends StatefulWidget {
  static var routerName = '/home';

  const Homepage({Key? key, required String value}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FLUTTER'),
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SearchPage()))
                    },
                icon: const Icon(Icons.search_sharp)),
            // IconButton(
            //   onPressed: () => {},
            //   icon: const Icon(Icons.notifications),
            // ),
          ],
        ),
        body: Grouplist(
          value: '',
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateGroup.routerName);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
          backgroundColor: Colors.grey[700],
          elevation: 0.0,
        ),
        drawer: const AppDrawer());
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 60 ||
        oldDelegate.minExtent != 60 ||
        child != oldDelegate.child;
  }
}
