abstract class AuthRepositry {
  Future<void> login(String email, String password);
  Future<void> signup(String email, String password);
  Future<void> forgetpassord (String email);
  Future<void> resetpassword (String email, String password, String password2);
}