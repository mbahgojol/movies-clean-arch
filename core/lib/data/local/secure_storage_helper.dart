import 'package:dependencies/dependencies.dart';

class SecureStorageHelper {
  late FlutterSecureStorage _secureStorage;

  SecureStorageHelper() {
    _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }

  /* AUTH TOKEN */

  static const _keyAuthToken = "auth_token";

  Future<void> setAuthToken(String value) => _secureStorage.write(
        key: _keyAuthToken,
        value: value,
      );

  Future<String?> getAuthToken() => _secureStorage.read(key: _keyAuthToken);

  Future<void> resetAuthToken() => _secureStorage.delete(key: _keyAuthToken);
}
