// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) => ShoppingList(
      listID: json['listID'] as String,
      shop: json['shop'] as String,
      color: json['color'] as String,
      shared: json['shared'] as bool,
      owner: json['owner'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ShoppingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShoppingListToJson(ShoppingList instance) =>
    <String, dynamic>{
      'listID': instance.listID,
      'shop': instance.shop,
      'color': instance.color,
      'shared': instance.shared,
      'owner': instance.owner,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
