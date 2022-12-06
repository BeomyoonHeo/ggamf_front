// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      image: json['image'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      time: json['time'] as String,
      count: json['count'] as String,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'content': instance.content,
      'time': instance.time,
      'count': instance.count,
    };
