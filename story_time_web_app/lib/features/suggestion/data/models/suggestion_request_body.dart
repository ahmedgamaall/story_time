import 'package:json_annotation/json_annotation.dart';

part 'suggestion_request_body.g.dart';

@JsonSerializable()
class SuggestionRequestBody {
  final String title;
  final String name;
  final String email;
  final String content;

  SuggestionRequestBody({
    required this.title,
    required this.name,
    required this.email,
    required this.content,
  });

  Map<String, dynamic> toJson() => _$SuggestionRequestBodyToJson(this);
}
