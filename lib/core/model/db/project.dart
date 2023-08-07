part of 'package:flutter_template/core/source/common/app_database.dart';

@DataClassName('Project')
class ProjectTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  TextColumn get url => text()();

  @JsonKey('image_url')
  TextColumn get imageUrl => text()();

  TextColumn get language => text()();

  @override
  Set<Column> get primaryKey => {id};
}
