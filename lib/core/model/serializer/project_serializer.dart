import 'package:flutter_template/core/model/db/repository_db_entity.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:stock/stock.dart';

class ProjectStockTypeMapper extends StockTypeMapper<ProjectDbEntity, Project> {
  @override
  ProjectDbEntity fromOutput(Project value) => ProjectDbEntity(
        id: value.id,
        description: value.description,
        name: value.name,
        url: value.url,
        language: value.language,
        imageUrl: value.imageUrl,
      );

  @override
  Project fromInput(ProjectDbEntity value) => Project(
        id: value.id,
        description: value.description,
        name: value.name,
        url: value.url,
        language: value.language,
        imageUrl: value.imageUrl,
      );
}

class ProjectListStockTypeMapper
    extends StockTypeMapper<List<ProjectDbEntity>, List<Project>> {
  final _projectSerializer = ProjectStockTypeMapper();

  @override
  List<Project> fromInput(List<ProjectDbEntity> value) =>
      value.map(_projectSerializer.fromInput).toList();

  @override
  List<ProjectDbEntity> fromOutput(List<Project> value) =>
      value.map(_projectSerializer.fromOutput).toList();
}
