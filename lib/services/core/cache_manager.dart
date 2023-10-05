import 'package:hive_flutter/adapters.dart';

import 'encrypt_service.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;

  CacheManager._internal();

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>('userToken');
  }

  Future<void> saveToken(String token) async {
    final encryptedToken = EncryptService.shared.encrypt(token);
    final boxSave = await Hive.openBox<String>('userToken');
    await boxSave.put('token', encryptedToken);
  }

  Future<String> getToken() async {
    final boxSave = await Hive.openBox<String>('userToken');
    String? encryptedToken = boxSave.get('token');
    if (encryptedToken == null) {
      return "No token data";
    } else {
      final decryptedToken = EncryptService.shared.decrypt(encryptedToken);
      return decryptedToken;
    }
  }

  Future<void> deleteToken() async {
    final userTokenBox = await Hive.openBox<String>('userToken');
    await userTokenBox.clear();
  }
}