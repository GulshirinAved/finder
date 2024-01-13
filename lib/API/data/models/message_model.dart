class Message {
  final int id;
  final int fromClientId;
  final int toClientId;
  final int status;
  final String text;
  final String createdAt;

  Message({
    required this.id,
    required this.fromClientId,
    required this.toClientId,
    required this.status,
    required this.text,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      fromClientId: json['fromClient_id'],
      toClientId: json['toClient_id'],
      status: json['status'],
      text: json['text'],
      createdAt: json['created_at'],
    );
  }
}
