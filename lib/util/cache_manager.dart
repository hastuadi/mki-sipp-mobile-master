import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypted_lib;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sipp_mobile/enums/local_key.dart';

class CacheManager {
  CacheManager._private();

  static CacheManager instance = CacheManager._private();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  factory CacheManager() {
    return instance;
  }

  static encrypted_lib.Encrypter _generateCipher() {
    final key = encrypted_lib.Key.fromUtf8("s1ppm0b1l3k3yn0onekn0wsibelievei");
    final b64Key = encrypted_lib.Key.fromBase64(base64Url.encode(key.bytes));
    final fernetObj = encrypted_lib.Fernet(b64Key);
    final encrypter = encrypted_lib.Encrypter(fernetObj);
    return encrypter;
  }

  static Future<void> _writeUserData(String key, String value) async {
    var encrypted = _generateCipher().encrypt(value);
    await _storage.write(key: key, value: encrypted.base64,
        aOptions: const AndroidOptions(encryptedSharedPreferences: true, keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding, storageCipherAlgorithm: StorageCipherAlgorithm.AES_CBC_PKCS7Padding)
    );
  }

  static Future<String?> _readUserData(String key) async {
    String? encryptedLocalData = await _storage.read(key: key, aOptions: const AndroidOptions(encryptedSharedPreferences: true, keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding, storageCipherAlgorithm: StorageCipherAlgorithm.AES_CBC_PKCS7Padding));
    if(encryptedLocalData != null) {
      String? localData = _generateCipher().decrypt(encrypted_lib.Encrypted.fromBase64(encryptedLocalData ?? " "));
      return localData;
    } else {
      return " ";
    }
  }

  Future<void> saveInitialUserData(String? token) async {
    await _writeUserData(SharedPrefs.isLogin.key, "true");
    await _writeUserData(SharedPrefs.token.key, token ?? "");
  }

  Future<bool> checkHasLogin() async {
    bool hasLogin = await _readUserData(SharedPrefs.isLogin.key) == "true";
    return hasLogin;
  }

}