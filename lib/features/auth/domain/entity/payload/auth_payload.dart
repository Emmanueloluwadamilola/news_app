class AuthPayload {
  final String email;
  final String password;
  final String? name;

  AuthPayload({
    required this.email,
    required this.password,
    this.name
  });
}
