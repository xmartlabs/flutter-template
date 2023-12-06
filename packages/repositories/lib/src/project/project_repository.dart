import 'package:models/project.dart';
import 'package:repositories/src/db/project_serializer.dart';
import 'package:repositories/src/db/repository_db_entity.dart';
import 'package:repositories/src/project/project_local_source.dart';
import 'package:repositories/src/project/project_remote_source.dart';
import 'package:stock/stock.dart';

class ProjectRepository {
  // ignore: unused_field
  final ProjectLocalSource _projectLocalSource;

  // ignore: unused_field
  final ProjectRemoteSource _projectRemoteSource;

  final Stock<dynamic, List<Project>> _store;

  ProjectRepository(this._projectLocalSource, this._projectRemoteSource)
      : _store = Stock(
          fetcher: Fetcher.ofFuture(
            (_) => _projectRemoteSource.getProjects(),
          ),
          sourceOfTruth: SourceOfTruth<dynamic, List<ProjectDbEntity>>(
            reader: (_) => _projectLocalSource.getProjects(),
            writer: (_, value) => _projectLocalSource.replaceProjects(value),
          ).mapToUsingMapper(ProjectListStockTypeMapper()),
        );

  Stream<List<Project>?> getProjects() => _store
      .stream(null)
      .where((event) => event.isData)
      .map((event) => event.requireData());
}
