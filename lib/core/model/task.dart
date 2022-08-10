import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

part 'task.g.dart';

@freezed
class Task with _$Task {
  @JsonSerializable()
  factory Task({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'completed') required bool isCompleted,
    required String description,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
