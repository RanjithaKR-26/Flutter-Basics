import 'package:flutter/material.dart';
import 'package:new_project/src/Screens/products/products_screens.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

var allgroup = """
 query allgroup{
  allgroup{
   name
   type
  }
}
  """;

class Grouplist extends StatefulWidget {
  final String value;

  Grouplist({Key? key, required this.value}) : super(key: key);

  @override
  _GrouplistState createState() => _GrouplistState();
}

class _GrouplistState extends State<Grouplist> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Query(
            options: QueryOptions(document: gql(allgroup)),
            builder: (QueryResult result, {fetchMore, refetch}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }
              if (result.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final listuser = result.data!['allgroup'];

              print(listuser);

              return ListView.builder(
                itemCount: listuser.length,
                itemBuilder: (context, index) {
                  final todo = listuser[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/bike1.jpg",
                      ),
                    ),
                    title: Text(
                      todo['name'],
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(todo['type']),
                    onTap: () {
                      Navigator.pushNamed(context, Products.routerName);
                    },
                  );
                },
              );
            }));
  }
}
