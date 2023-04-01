# Open-Closed Principle (OCP)

<p align="center">
  <img src="https://user-images.githubusercontent.com/69586214/229273111-eac7a5b5-e9f2-4eb6-a8d7-16b3594252eb.png" alt="Interface Segregation Principle" width="700">
  <br>
</p>

The second principle of SOLID is the **Open-Closed Principle**, abbreviated as **OCP**.

This principle states that :

> `software entities` (such as classes, modules, functions, etc.) should be open for extension but closed for modification.

In other words, when you want to add a new feature to the program, it should be added in the form of new code rather than refactoring and modifying existing code. This means that a software entity should be extendable without modifying itself.


<br>


## Example

Suppose we have a Message class to send messages to our users as below, and for now, we are using the SMS web service.

```dart
import 'sms_message.dart';

class Message {
  void sendMessage(SmsMessage smsMessage) {
    // implement send sms
  }
}
```

```dart
class SmsMessage {
  final String phone, content;

  SmsMessage({
    required this.phone,
    required this.content,
  });
}
```

Later on, we will decide to send messages to our users via email service as well, and we will create another class for this service.

```dart
class EmailMessage {
  final String email, content;

  EmailMessage({
    required this.email,
    required this.content,
  });
}
```

In order for the Message class to be able to send messages to users using both SMS and email services, it should be modified in the following way.

```dart
import 'email_message.dart';
import 'sms_message.dart';

class Message {
  void message(dynamic message) {
    if (message is SmsMessage) {
      // implement send sms
    } else if (message is EmailMessage) {
      // implement send email
    }
  }
}
```

By doing this, we have changed the main method of the Message class. However, if we need to use other services for sending messages later, we would have to perform the message sending operation by checking the type of service in the same way، which This violates the second principle of SOLID.

Therefore, our class should be designed to allow us to add different services without changing the existing code.

<br>

#### ✅ Well, what’s the solution?

We need to create an `interface` for our messages that has a `send method`, and **all message services should implement this method according to their own mechanism of operation**. 

This way, the implementation of the send method for SMS and email will be different, and we won't need to use an instance of the message to check its type.

```dart
abstract class MessageInterface {
  void send();
}
```

```dart
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
```

```dart
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
```

```dart
import 'message_interface.dart';

class Message {
  void send(MessageInterface message) {
    message.send();
  }
}
```

By doing this, we have followed the OCP principle, and now if any other service is created, we just need to create a class for it that implements our interface. 

In this way, our send method in the Message class remains unchanged with the addition of different services.
