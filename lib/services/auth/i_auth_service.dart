abstract class IAuthService {
  Future<void> login(String email, String password, Function()? onSuccess);
  Future<void> logout();
}