class EndPoint {
  static const String baseUrl = "http://resala.runasp.net";
  static const String login = "/api/v1/auth/login";
  static const String register = "/api/v1/auth/register";
  static const String verfiyEmail = "/api/v1/auth/verify-email";
  static const String forgetPassword = "/api/v1/auth/forgot-password";
  static const String resetPassword = "/api/v1/auth/reset-password";
  static const String resendOTP = "/api/v1/auth/resend-otp";
  static const String getAllSposorships = "/api/v1/sponsorships";
  static const String getSposorshipsByID = "/api/v1/sponsorships/";
  static const String getAllEmergencyCases = "/api/v1/emergency-cases";
  static const String getEmergencyCasesByID = "/api/v1/emergency-cases/";
}

class ApiKeys {
  static const String email = "email";
  static const String password = "password";
  static const String name = "name";
  static const String phone = "phoneNumber";
  static const String job = "job";
  static const String landline = "landline";
  static const String confirmPassword = "confirmPassword";
  static const String role = "role";
  static const String otp = "otp";
  static const String newPassword = "newPassword";
  static const String statusCode = "statusCode";
  static const String userId = "userId";
  static const String id = "id";
  static const String data = "data";
  static const String message = "message";
  static const String token = "token";
  static const String errors = "errors";
  static const String meta = "meta";
  static const String succeeded = "succeeded";
  static const String isLogged = "isLogged";
  static const String isVisitedOnBoarding = "isVisitedOnBoarding";
  static const String resetPasswordEmail = "resetPasswordEmail";
  static const String resetPasswordOtp = "resetPasswordOtp";
  static const String emailVerification = "EmailVerification";
  static const String passwordReset = "PasswordReset";
  static const String otpType = "otpType";
  static const String description = 'description';
  static const String imageUrl = 'imageUrl';
  static const String icon = 'icon';
  static const String targetAmount = 'targetAmount';
  static const String collectedAmount = 'collectedAmount';
  static const String isActive = 'isActive';
  static const String createdAt = 'createdAt';
}
