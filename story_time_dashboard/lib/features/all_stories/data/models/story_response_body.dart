import 'package:json_annotation/json_annotation.dart';

part 'story_response_body.g.dart';

@JsonSerializable()
class StoryResponseBody {
  final String docId;
  final String title;
  final String moral;
  final String section;
  final String content;
  final String cover;

  StoryResponseBody({
    required this.docId,
    required this.title,
    required this.moral,
    required this.section,
    required this.content,
    required this.cover,
  });

  factory StoryResponseBody.fromJson(Map<String, dynamic> json) => _$StoryResponseBodyFromJson(json);
}
