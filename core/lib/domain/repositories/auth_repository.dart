abstract class AuthRepository {
  Future<void> login(String emailAddress, String password);
}
