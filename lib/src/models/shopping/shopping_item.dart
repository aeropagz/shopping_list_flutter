import 'package:json_annotation/json_annotation.dart';

part 'shopping_item.g.dart';

@JsonSerializable()
class ShoppingItem {
  final String name;
  final int amount;
  final String id;

  ShoppingItem({
    required this.name,
    required this.amount,
    required this.id,
  });

  factory ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingItemToJson(this);
}
