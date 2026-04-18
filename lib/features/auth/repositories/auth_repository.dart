import '../models/user_model.dart';
import '../models/login_request_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(LoginRequestModel request);
  Future<UserModel> register(LoginRequestModel request);
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
}