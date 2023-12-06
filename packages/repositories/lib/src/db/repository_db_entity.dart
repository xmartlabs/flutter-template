import 'package:floor/floor.dart';

@Entity(tableName: 'projects')
class ProjectDbEntity {
  @primaryKey
  final int id;
  final String name;
  final String description;
  final String url;
  final String imageUrl;
  final String language;

  ProjectDbEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.language,
  });
}
