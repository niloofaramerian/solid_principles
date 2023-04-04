# Single Responsibility Principle (SRP)

<p align="center">
  <img src="https://user-images.githubusercontent.com/69586214/229285878-5024134a-9b3e-4fa7-a03a-a8721f291c32.png" alt="Single Responsibility Principle" width="700">
  <br>
</p>

The first principle of SOLID is the **Single Responsibility Principle**, abbreviated as **SRP**.

This principle states that :

> Every class, module or function in a program should have one responsibility in a program.

In other words, every class should have only one responsibility and one reason to change.


<br>


## Example

Suppose we have a User class as follows:

```dart
class User {
  void getInformation() {
    // Code to get user information
  }

  void sendEmail() {
    // Code to send email
  }

  void getOrder() {
    // Code to get user order
  }
}

```

Do you think this class respects SRP?? The User class is only doing one thing?!

Definitely not.

This class performs 3 tasks and only the getInformation method is related to the User class and the rest of the methods perform different tasks, which this violates the first principle of SOLID.

<br>

#### ✅ Well, what’s the solution?

We have to separate the different tasks from the User class and create a separate class for each one.

This will make the development of this class and the other classes easier and the code will be much cleaner.

```dart
class User {
  void getInformation() {
    // Code to get user information
  }
}
```

```dart
import 'user.dart';

class Email {
  void sendEmail(User user) {
    // Code to send email
  }
}
```

```dart
import 'user.dart';

class Order {
  void getOrder(User user) {
    // Code to get user order
  }
}
```

By doing this, we have followed the SRP principle.
