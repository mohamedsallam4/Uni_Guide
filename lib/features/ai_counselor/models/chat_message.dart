class ChatMessage {
  final String id;
  final String content;
  final bool isUser;

  const ChatMessage({
    required this.id,
    required this.content,
    required this.isUser,
  });
}