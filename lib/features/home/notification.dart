class NotificationModel {
  final int id;
  final int userId;
  final String title;
  final String subtitle;
  final String date;
  final bool ack;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.ack,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      subtitle: json['subtitle'],
      date: json['date'],
      ack: json['ack'],
    );
  }
}
