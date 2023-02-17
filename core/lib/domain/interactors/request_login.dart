import 'package:core/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@lazySingleton
class RequestLogin extends Interactor<Params> {
  final AuthRepository authRepository;

  RequestLogin(this.authRepository);

  @override
  Future<void> doWork(Params params) async {
    await authRepository.login(params.emailAddress, params.password);
  }
}

class Params {
  final String emailAddress;
  final String password;

  Params({
    required this.emailAddress,
    required this.password,
  });
}
