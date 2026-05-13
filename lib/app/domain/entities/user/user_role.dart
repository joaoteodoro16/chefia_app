enum UserRole {
  admin(1),
  operator(2),
  unknown(0);

  final int code;

  const UserRole(this.code);

  static UserRole fromCode(int code) {
    return UserRole.values.firstWhere(
      (role) => role.code == code,
      orElse: () => UserRole.unknown,
    );
  }
}