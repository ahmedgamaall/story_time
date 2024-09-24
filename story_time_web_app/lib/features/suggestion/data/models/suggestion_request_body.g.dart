// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionRequestBody _$SuggestionRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SuggestionRequestBody(
      title: json['title'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$SuggestionRequestBodyToJson(
        SuggestionRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'email': instance.email,
      'content': instance.content,
    };
