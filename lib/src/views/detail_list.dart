import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/src/models/shopping/shopping_list.dart';
import 'package:shopping_list/src/state/lists_provider.dart';

class DetailList extends StatelessWidget {
  final int listIndex;

  const DetailList({Key? key, required this.listIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingList currentList =
        context.watch<ListResponseProvider>().listResponse!.lists[listIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(currentList.shop),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: List.generate(
          currentList.items.length,
          (index) => ListTile(
            title: Text(currentList.items[index].name),
            subtitle: Text("Amount: ${currentList.items[index].amount}"),
            trailing: Icon(
              Icons.done,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
    );
  }
}
