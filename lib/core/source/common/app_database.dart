
import 'package:drift/drift.dart';
import 'package:flutter_template/core/source/project_local_source.dart';

part 'app_database.g.dart';

part 'package:flutter_template/core/model/db/project.dart';

@DriftDatabase(
  tables: [
    ProjectTable,
  ],
  daos: [ProjectLocalSource],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
  @override
  // TODO: implement migration
  MigrationStrategy get migration => super.migration;
}
