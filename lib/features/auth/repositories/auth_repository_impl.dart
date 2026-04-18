import 'package:uuid/uuid.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/endpoints.dart';
import '../models/user_model.dart';
import '../models/login_request_model.dart';
import '../models/auth_response_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;
  final Uuid _uuid = const Uuid();

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<UserModel> login(LoginRequestModel request) async {
    final response = await _apiClient.post(ApiEndpoints.login, request.toJson());
    final authResponse = AuthResponseModel.fromJson(response);
    // In a real app, save token to secure storage
    return authResponse.user;
  }

  @override
  Future<UserModel> register(LoginRequestModel request) async {
    final response = await _apiClient.post(ApiEndpoints.register, request.toJson());
    final authResponse = AuthResponseModel.fromJson(response);
    return authResponse.user;
  }

  @override
  Future<void> logout() async {
    // Clear token from storage
    await _apiClient.post(ApiEndpoints.logout, {});
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    // In a real app, check if token exists and validate it
    // For now, return null
    return null;
  }
}