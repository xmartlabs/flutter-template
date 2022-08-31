// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskLocalSource? _taskLocalSourceInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tasks` (`id` INTEGER NOT NULL, `description` TEXT NOT NULL, `isCompleted` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskLocalSource get taskLocalSource {
    return _taskLocalSourceInstance ??=
        _$TaskLocalSource(database, changeListener);
  }
}

class _$TaskLocalSource extends TaskLocalSource {
  _$TaskLocalSource(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _taskDbEntityInsertionAdapter = InsertionAdapter(
            database,
            'tasks',
            (TaskDbEntity item) => <String, Object?>{
                  'id': item.id,
                  'description': item.description,
                  'isCompleted': item.isCompleted ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskDbEntity> _taskDbEntityInsertionAdapter;

  @override
  Stream<List<TaskDbEntity>> getTasks() {
    return _queryAdapter.queryListStream('SELECT * FROM tasks',
        mapper: (Map<String, Object?> row) => TaskDbEntity(
            id: row['id'] as int,
            description: row['description'] as String,
            isCompleted: (row['isCompleted'] as int) != 0),
        queryableName: 'tasks',
        isView: false);
  }

  @override
  Future<void> deleteAllTasks() async {
    await _queryAdapter.queryNoReturn('DELETE FROM tasks');
  }

  @override
  Future<void> insertTasks(List<TaskDbEntity> tasks) async {
    await _taskDbEntityInsertionAdapter.insertList(
        tasks, OnConflictStrategy.replace);
  }

  @override
  Future<void> replaceTasks(List<TaskDbEntity>? tasks) async {
    if (database is sqflite.Transaction) {
      await super.replaceTasks(tasks);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.taskLocalSource.replaceTasks(tasks);
      });
    }
  }
}
