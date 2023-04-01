import 'message_interface.dart';

class EmailMessage implements MessageInterface {
  final String email, content;

  EmailMessage({
    required this.email,
    required this.content,
  });

  @override
  void send() {
    // implement send email
  }
}
