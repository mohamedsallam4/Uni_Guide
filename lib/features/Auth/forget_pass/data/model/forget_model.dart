class ForgetPasswordModel {
  final int status;
  final String message;
  final String otp;

  ForgetPasswordModel({
    required this.status,
    required this.message,
    required this.otp,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      status: json['status'],
      message: json['message'],
      otp: json['data']['otp'].toString(),
    );
  }
}