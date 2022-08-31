import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

part 'project.g.dart';

@freezed
class Project with _$Project {
  @JsonSerializable()
  factory Project({
    required int id,
    required String name,
    required String description,
    required String url,
    required String imageUrl,
    required String language,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
