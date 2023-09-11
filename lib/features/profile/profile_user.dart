class ProfileUser {
  final int id;
  final String email;
  final String password;
  final DateTime birthdate;
  final String address;
  final String name;
  final String? phone;
  final String? profilePicture;
  final List<String> authorities;
  final bool enabled;
  final bool accountNonExpired;
  final bool accountNonLocked;
  final bool credentialsNonExpired;
  final String username;

  ProfileUser({
    required this.id,
    required this.email,
    required this.password,
    required this.birthdate,
    required this.address,
    required this.name,
    this.phone,
    this.profilePicture,
    required this.authorities,
    required this.enabled,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
    required this.username,
  });

  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      birthdate: DateTime.parse(json['birthdate']),
      address: json['address'],
      name: json['name'],
      phone: json['phone'],
      profilePicture: json['profilePicture'],
      authorities: List<String>.from(json['authorities']),
      enabled: json['enabled'],
      accountNonExpired: json['accountNonExpired'],
      accountNonLocked: json['accountNonLocked'],
      credentialsNonExpired: json['credentialsNonExpired'],
      username: json['username'],
    );
  }
}
