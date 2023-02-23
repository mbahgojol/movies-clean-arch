import 'package:injectable/injectable.dart';

import '../secure_storage_helper.dart';

@module
abstract class LocalModule {
  @lazySingleton
  SecureStorageHelper get secureStorageHelper => SecureStorageHelper();
}
