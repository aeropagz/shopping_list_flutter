import 'package:json_annotation/json_annotation.dart';
import 'shopping_list.dart';

part 'lists_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ListResponse {
  @JsonKey(name: '_id')
  String id;
  String userID;
  @JsonKey(required: true)
  List<ShoppingList> lists;

  ListResponse({
    required this.id,
    required this.userID,
    required this.lists,
  });

  factory ListResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListResponseToJson(this);
}
