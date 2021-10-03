// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingItem _$ShoppingItemFromJson(Map<String, dynamic> json) => ShoppingItem(
      name: json['name'] as String,
      amount: json['amount'] as int,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ShoppingItemToJson(ShoppingItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'id': instance.id,
    };
