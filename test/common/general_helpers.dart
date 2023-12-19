import 'package:dio/dio.dart';
import 'package:flutter_template/core/source/common/app_database.dart';

Future<AppDatabase> setupFloorDatabase() =>
    $FloorAppDatabase.inMemoryDatabaseBuilder().build();

Response successResponse(List elem, RequestOptions requestOptions) => Response(
      data: elem.map((e) => e.toJson()).toList(),
      statusCode: 200,
      requestOptions: requestOptions,
    );
