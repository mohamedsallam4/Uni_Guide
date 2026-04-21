class VerifyOtpModel {
  final int status;
  final String message;
  final VerifyOtpData data;

  VerifyOtpModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      status: json['status'],
      message: json['message'],
      data: VerifyOtpData.fromJson(json['data']),
    );
  }
}

class VerifyOtpData {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  VerifyOtpData({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) {
    return VerifyOtpData(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }
}