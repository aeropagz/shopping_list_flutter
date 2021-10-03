import 'package:json_annotation/json_annotation.dart';

import 'shopping_item.dart';

part 'shopping_list.g.dart';

@JsonSerializable(explicitToJson: true)
class ShoppingList {
  final String listID;
  final String shop;
  final String color;
  final bool shared;
  final String owner;
  final List<ShoppingItem> items;

  ShoppingList({
    required this.listID,
    required this.shop,
    required this.color,
    required this.shared,
    required this.owner,
    required this.items,
  });

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingListToJson(this);
}
