import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FakeFlutterSecureStorage extends FlutterSecureStorage {
  static void setInitialData(Map<String, String> initialData) {
    FlutterSecureStorage.setMockInitialValues(initialData);
  }
}
