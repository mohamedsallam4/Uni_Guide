class LoginModel {
  final int status;
  final String message;
  final Data data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}
class Data {
  final User user;
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }
}
class User {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? avatar;
  final String createdAt;
  final String updatedAt;
  final String type;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.avatar,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      avatar: json['avatar'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      type: json['type'],
    );
  }
}