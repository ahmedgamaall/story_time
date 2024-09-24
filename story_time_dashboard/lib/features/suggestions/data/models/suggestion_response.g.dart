// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionResponse _$SuggestionResponseFromJson(Map<String, dynamic> json) =>
    SuggestionResponse(
      title: json['title'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$SuggestionResponseToJson(SuggestionResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'email': instance.email,
      'content': instance.content,
    };
