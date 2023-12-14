import 'package:flutter_template/core/source/common/app_database.dart';

Future<AppDatabase> setupFloorDatabase() async =>
    $FloorAppDatabase.inMemoryDatabaseBuilder().build();
