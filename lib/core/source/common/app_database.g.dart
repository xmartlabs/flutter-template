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

  ProjectLocalSource? _projectLocalSourceInstance;

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
            'CREATE TABLE IF NOT EXISTS `projects` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `url` TEXT NOT NULL, `imageUrl` TEXT NOT NULL, `language` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProjectLocalSource get projectLocalSource {
    return _projectLocalSourceInstance ??=
        _$ProjectLocalSource(database, changeListener);
  }
}

class _$ProjectLocalSource extends ProjectLocalSource {
  _$ProjectLocalSource(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _projectDbEntityInsertionAdapter = InsertionAdapter(
            database,
            'projects',
            (ProjectDbEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'url': item.url,
                  'imageUrl': item.imageUrl,
                  'language': item.language
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProjectDbEntity> _projectDbEntityInsertionAdapter;

  @override
  Stream<List<ProjectDbEntity>> getProjects() {
    return _queryAdapter.queryListStream('SELECT * FROM projects',
        mapper: (Map<String, Object?> row) => ProjectDbEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            url: row['url'] as String,
            imageUrl: row['imageUrl'] as String,
            language: row['language'] as String),
        queryableName: 'projects',
        isView: false);
  }

  @override
  Future<void> deleteAllProjects() async {
    await _queryAdapter.queryNoReturn('DELETE FROM projects');
  }

  @override
  Future<void> insertProjects(List<ProjectDbEntity> projects) async {
    await _projectDbEntityInsertionAdapter.insertList(
        projects, OnConflictStrategy.replace);
  }

  @override
  Future<void> replaceProjects(List<ProjectDbEntity>? projects) async {
    if (database is sqflite.Transaction) {
      await super.replaceProjects(projects);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.projectLocalSource.replaceProjects(projects);
      });
    }
  }
}
