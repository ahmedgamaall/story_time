import 'package:json_annotation/json_annotation.dart';

part 'suggestion_response.g.dart';

@JsonSerializable()
class SuggestionResponse {
  final String title;
  final String name;
  final String email;
  final String content;

  SuggestionResponse({
    required this.title,
    required this.name,
    required this.email,
    required this.content,
  });

  factory SuggestionResponse.fromJson(Map<String, dynamic> json) => _$SuggestionResponseFromJson(json);
}
