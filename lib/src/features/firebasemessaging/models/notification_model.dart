class NotificationModel {
  final String title;
  final String body;
  final String payload;

  NotificationModel({
    required this.title,
    required this.body,
    required this.payload,
  });

  static NotificationModel empty() => NotificationModel(
        title: '',
        body: '',
        payload: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'payload': payload,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      body: json['body'],
      payload: json['payload'],
    );
  }
}
