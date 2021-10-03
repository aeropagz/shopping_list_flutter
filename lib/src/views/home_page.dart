import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shopping_list/src/models/shopping/shopping_list.dart';
import 'package:shopping_list/src/state/lists_provider.dart';
import 'package:shopping_list/src/state/user_provider.dart';
import 'package:shopping_list/src/views/detail_list.dart';
import '../models/shopping/lists_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userToken;
  final Uri listsUrl = Uri.parse("https://simplelist.de:8080/lists");

  Future<ListResponse> _getShoppingListsAsJson(BuildContext context) async {
    final res = await http.get(
      listsUrl,
      headers: <String, String>{
        'Authorization': 'Bearer $userToken',
      },
    );
    if (res.statusCode == 200) {
      ListResponse listRes =
          ListResponse.fromJson(convert.jsonDecode(res.body));
      context.read<ListResponseProvider>().setResponse(listRes);
      return listRes;
    } else {
      throw "Failed to get lists";
    }
  }

  @override
  Widget build(BuildContext context) {
    userToken = context.watch<UserProvider>().user!.token;
    if (userToken == null) {
      Navigator.of(context).pushReplacementNamed('login');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your lists'),
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: FutureBuilder(
        future: _getShoppingListsAsJson(context),
        builder: (BuildContext context, AsyncSnapshot<ListResponse> snapshot) {
          if (snapshot.hasData) {
            List<ShoppingList> shoppingLists = snapshot.data!.lists;
            return ListView(
              children: List.generate(
                  shoppingLists.length,
                  (index) => Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(shoppingLists[index].shop),
                        subtitle:
                            Text("${shoppingLists[index].items.length} Items"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailList(listIndex: index)));
                        },
                      ))),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
