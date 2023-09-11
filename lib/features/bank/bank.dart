class Bank {
  final int id;
  final int userId;
  final String name;
  final String icon;

  Bank({
    required this.id,
    required this.userId,
    required this.name,
    required this.icon,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      icon: json['icon'],
    );
  }
}
