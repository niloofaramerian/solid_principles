import 'message_interface.dart';

class SmsMessage implements MessageInterface {
  final String phone, content;

  SmsMessage({
    required this.phone,
    required this.content,
  });

  @override
  void send() {
    // implement send sms
  }
}
