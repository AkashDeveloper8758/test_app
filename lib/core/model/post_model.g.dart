// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      birthday: json['birthday'] as String?,
      id: json['char_id'] as int,
      img: json['img'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'char_id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'img': instance.img,
    };
