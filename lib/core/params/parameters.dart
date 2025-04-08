class LoginParams {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
}

class RegisterParams {
  final String fullname;
  final String phone;
  final String email;
  final String password;

  RegisterParams({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.password,
  });
}


