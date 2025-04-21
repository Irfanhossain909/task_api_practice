class LoginModel {
  final bool success;
  final String message;
  final String accessToken;
  final String refreshToken;

  LoginModel({
    required this.success,
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: true,
      message: json['message'] ?? '',
      accessToken: json['data']['accessToken'] ?? '',
      refreshToken: json['data']['refreshToken'] ?? '',
    );
  }
}
