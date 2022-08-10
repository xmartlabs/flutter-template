// database.dart

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_template/core/model/db/task_db_entity.dart';
import 'package:flutter_template/core/source/task_local_source.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [TaskDbEntity])
abstract class AppDatabase extends FloorDatabase {
  TaskLocalSource get taskLocalSource;
}
