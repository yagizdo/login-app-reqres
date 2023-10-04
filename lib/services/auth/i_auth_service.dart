abstract class IAuthService {
  Future<void> login(String email, String password);
  Future<void> logout();
}