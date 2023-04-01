import 'email_message.dart';
import 'sms_message.dart';

class Message {
  // void sendMessage(SmsMessage smsMessage) {
  //   // implement send sms
  // }

  void message(dynamic message) {
    if (message is SmsMessage) {
      // implement send sms
    } else if (message is EmailMessage) {
      // implement send email
    }
  }
}
