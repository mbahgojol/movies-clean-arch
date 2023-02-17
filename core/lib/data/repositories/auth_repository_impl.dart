import 'package:core/data/local/secure_storage_helper.dart';
import 'package:core/data/network/datasources/auth_data_source.dart';
import 'package:core/data/network/dtos/login_request_dto.dart';
import 'package:core/domain/repositories/auth_repository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;
  final SecureStorageHelper secureStorageHelper;

  AuthRepositoryImpl(
    this.authDataSource,
    this.secureStorageHelper,
  );

  @override
  Future<void> login(String emailAddress, String password) async {
    final param = LoginRequestDto(
      emailAddress: emailAddress,
      password: password,
    );
    final result = await authDataSource.login(param);

    secureStorageHelper.setAuthToken(result.authToken);
  }
}
