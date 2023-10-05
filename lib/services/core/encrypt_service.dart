import 'package:encrypt/encrypt.dart';

class EncryptService {

  EncryptService._();

  static final shared = EncryptService._();

  final _key = Key.fromLength(32);
  final _iv = IV.fromLength(16);

  String encrypt(String plainText) {
    final encrypter = Encrypter(AES(_key));
    final encrypted = encrypter.encrypt(plainText, iv: _iv);
    return encrypted.base64;
  }

  String decrypt(String encryptedText) {
    final encrypter = Encrypter(AES(_key));
    final encrypted = Encrypted.fromBase64(encryptedText);
    final decrypted = encrypter.decrypt(encrypted, iv: _iv);
    return decrypted;
  }
}