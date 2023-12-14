import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'projects')
class ProjectDbEntity extends Equatable {
  @primaryKey
  final int id;
  final String name;
  final String description;
  final String url;
  final String imageUrl;
  final String language;

  const ProjectDbEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.language,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        url,
        imageUrl,
        language,
      ];
}
