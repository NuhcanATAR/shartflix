import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // secure storage
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> saveTokenSecurely(String token) async {
    await secureStorage.write(key: 'auth_token', value: token);
  }
}
