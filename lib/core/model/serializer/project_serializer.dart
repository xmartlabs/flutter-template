import 'package:flutter_template/core/model/db/repository_db_entity.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:stock/stock.dart';

class ProjectStockTypeMapper extends StockTypeMapper<ProjectDbEntity, Project> {
  @override
  ProjectDbEntity fromOutput(Project commonModel) => ProjectDbEntity(
        id: commonModel.id,
        description: commonModel.description,
        name: commonModel.name,
        url: commonModel.url,
        language: commonModel.language,
        imageUrl: commonModel.imageUrl,
      );

  @override
  Project fromInput(ProjectDbEntity serviceModel) => Project(
        id: serviceModel.id,
        description: serviceModel.description,
        name: serviceModel.name,
        url: serviceModel.url,
        language: serviceModel.language,
        imageUrl: serviceModel.imageUrl,
      );
}

class ProjectListStockTypeMapper
    extends StockTypeMapper<List<ProjectDbEntity>, List<Project>> {
  final _projectSerializer = ProjectStockTypeMapper();

  @override
  List<Project> fromInput(List<ProjectDbEntity> databaseModel) =>
      databaseModel.map(_projectSerializer.fromInput).toList();

  @override
  List<ProjectDbEntity> fromOutput(List<Project> commonModel) =>
      commonModel.map(_projectSerializer.fromOutput).toList();
}
