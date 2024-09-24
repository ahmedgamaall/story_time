import 'package:json_annotation/json_annotation.dart';

part 'story_request_body.g.dart';

@JsonSerializable()
class StoryRequestBody {
  final String docId;
  final String title;
  final String moral;
  final String section;
  final String content;
  final String cover;

  StoryRequestBody({
    required this.docId,
    required this.title,
    required this.moral,
    required this.section,
    required this.content,
    required this.cover,
  });

  Map<String, dynamic> toJson() => _$StoryRequestBodyToJson(this);
}
