import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/core/source/common/hive_base_source.dart';

class ProjectLocalSource extends HiveBaseSource<Project, int> {
  ProjectLocalSource()
      : super(
          dbParser: (project) => project.toJson(),
          modelParser: (project) => Project.fromJson(project),
        );

  Future<List<Project>> replaceProjects(List<Project> elements) async {
    await deleteAllElements();
    return putAllElements(
      Map.fromEntries(
        elements.map(
          (e) => MapEntry(e.id, e),
        ),
      ),
    );
  }
}
