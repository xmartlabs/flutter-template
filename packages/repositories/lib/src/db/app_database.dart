// database.dart

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:repositories/src/db/repository_db_entity.dart';
import 'package:repositories/src/project/project_local_source.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [ProjectDbEntity])
abstract class AppDatabase extends FloorDatabase {
  ProjectLocalSource get projectLocalSource;

  Future<void> clearAllTables() async {
    await database.delete('projects');
  }
}
