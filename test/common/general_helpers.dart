import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

Response successResponse(List elem, RequestOptions requestOptions) => Response(
      data: elem.map((e) => e.toJson()).toList(),
      statusCode: 200,
      requestOptions: requestOptions,
    );

Directory initHive() {
  final tempDir = Directory.systemTemp.createTempSync('hive_test_');
  Hive.init(tempDir.path);
  return tempDir;
}

Future<void> closeHive(Directory tempDir) async {
  await Hive.close();
  if (tempDir.existsSync()) {
    await tempDir.delete(recursive: true);
  }
}
