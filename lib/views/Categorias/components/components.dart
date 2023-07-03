import 'package:fin/views/Categorias/Categoria.dart';
import 'package:flutter/material.dart';


class ItemSearchDelegate extends SearchDelegate {
  final List<Item> itemList;

  ItemSearchDelegate(this.itemList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Item> searchResults = itemList
        .where((item) =>
            item.title.toLowerCase().contains(query.toLowerCase()) ||
            item.subtitle.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        Item item = searchResults[index];
        return ListTile(
          leading: Icon(item.iconData),
          title: Text(item.title),
          subtitle: Text(item.subtitle),
          onTap: () {
            close(context, item);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Item> searchResults = itemList
        .where((item) =>
            item.title.toLowerCase().contains(query.toLowerCase()) ||
            item.subtitle.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        Item item = searchResults[index];
        return ListTile(
          leading: Icon(item.iconData),
          title: Text(item.title),
          subtitle: Text(item.subtitle),
          onTap: () {
            query = item.title;
            showResults(context);
          },
        );
      },
    );
  }
}
