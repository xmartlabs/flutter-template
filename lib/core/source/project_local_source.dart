import 'dart:convert';

import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/core/source/common/hive_base_source.dart';

class ProjectLocalSource extends HiveBaseSource<int, Project> {
  ProjectLocalSource()
      : super(
          dbParser: (project) => jsonEncode(project.toJson()),
          modelParser: (project) => Project.fromJson(jsonDecode(project)),
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
