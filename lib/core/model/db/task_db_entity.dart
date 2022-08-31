import 'package:floor/floor.dart';

@Entity(tableName: 'tasks')
class TaskDbEntity {
  @primaryKey
  final int id;
  final String description;
  final bool isCompleted;

  TaskDbEntity({
    required this.id,
    required this.description,
    required this.isCompleted,
  });
}
