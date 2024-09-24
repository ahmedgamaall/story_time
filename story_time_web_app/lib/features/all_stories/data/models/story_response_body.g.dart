// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryResponseBody _$StoryResponseBodyFromJson(Map<String, dynamic> json) =>
    StoryResponseBody(
      docId: json['docId'] as String,
      title: json['title'] as String,
      moral: json['moral'] as String,
      section: json['section'] as String,
      content: json['content'] as String,
      cover: json['cover'] as String,
    );

Map<String, dynamic> _$StoryResponseBodyToJson(StoryResponseBody instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'title': instance.title,
      'moral': instance.moral,
      'section': instance.section,
      'content': instance.content,
      'cover': instance.cover,
    };
