class UserDetails {
  final String username;
  final String email;
  final String password;
  final String? userId;

  UserDetails(
      {this.userId,
      required this.username,
      required this.email,
      required this.password});
}
