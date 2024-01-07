class UserModel {
  final String email;
  final String password;
  final String? phoneNumber;
  final String? fullName;
  UserModel({
    required this.email,
    required this.password,
    this.fullName,
    this.phoneNumber,
  });
}
