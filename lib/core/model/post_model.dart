import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  @JsonKey(name: 'char_id')
  int id;
  String? name;
  String? birthday;
  String? img;
  PostModel({
    required this.birthday,
    required this.id,
    required this.img,
    required this.name,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
