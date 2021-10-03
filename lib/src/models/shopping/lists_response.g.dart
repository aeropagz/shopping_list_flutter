// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponse _$ListResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['lists'],
  );
  return ListResponse(
    id: json['_id'] as String,
    userID: json['userID'] as String,
    lists: (json['lists'] as List<dynamic>)
        .map((e) => ShoppingList.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListResponseToJson(ListResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userID': instance.userID,
      'lists': instance.lists.map((e) => e.toJson()).toList(),
    };
