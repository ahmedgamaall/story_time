// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryRequestBody _$StoryRequestBodyFromJson(Map<String, dynamic> json) =>
    StoryRequestBody(
      docId: json['docId'] as String,
      title: json['title'] as String,
      moral: json['moral'] as String,
      section: json['section'] as String,
      content: json['content'] as String,
      cover: json['cover'] as String,
    );

Map<String, dynamic> _$StoryRequestBodyToJson(StoryRequestBody instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'title': instance.title,
      'moral': instance.moral,
      'section': instance.section,
      'content': instance.content,
      'cover': instance.cover,
    };
