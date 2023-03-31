# Dependency Inversion Principle (DIP)

<p align="center">
  <img src="https://user-images.githubusercontent.com/69586214/227493102-f3e0808e-800d-4520-a768-c36cb82b77ac.png" alt="Dependency Inversion Principle" width="700">
  <br>
</p>


The fifth principle of SOLID is the **Dependency Inversion Principle**, abbreviated as **DIP**.

This principle states that :

> High-level modules should not depend on low-level modules. Both should depend on the `abstraction`.
> 
> Abstractions should not depend on details. Details should depend on abstractions.

<br>

## What is dependency ?

```dart
class A {
  final B b;

  A({required this.b});
}
```

Class A is dependent on class B to perform its operations, So **class A** is a `high-level class` and **class B** is a `low-level class`.

<br>

## What is Abstraction ?
Animal and Food are examples of abstract concepts, meaning they are mental models that do not exist in the real world and are not implementable. 

In the real world, we observe specific types of animals, such as dogs, and specific types of food, such as spaghetti, and so on. This means that we cannot implement abstract concepts such as “foods” and “animals,” but dogs and spaghetti do exist and are implementable.

**`Interfaces`** and **`Abstract classes`** are tools for abstract concepts.

<br>

## Why we need Dependency Inversion Principle ?
DIP helps you to make your code **loose coupled** rather than **tightly coupled**.
- `Loose coupling` : When an object gets the object to be used from external sources, we call it loose coupling. In other words, loose coupling means that the objects are independent.
- `Tight coupling` : When a group of classes are highly dependent on one another then it is called tight coupling.


<br>

## Example

Suppose you are working on a software project with a team consisting of Front-end and Back-end developers.


```dart
class BackEndDeveloper { 

  void writeJava() {}
  
}
```
```dart
class FrontEndDeveloper { 

  void writeJavaScript() {}
  
}

```

And the project requires both front-end and back-end for implementation.

```dart
import 'back_end_developer.dart';
import 'front_end_developer.dart';

class Project {
  final backEndDeveloper = BackEndDeveloper();
  final frontEndDeveloper = FrontEndDeveloper();

  void implement() {
    backEndDeveloper.writeJava();
    frontEndDeveloper.writeJavaScript();
  }
}
```

**The high-level class, which is the Project, depends on the lower-level classes of FrontEndDeveloper and BackEndDeveloper in order to continue its work.** And if we want to make a change in the lower-level classes, it may directly affect the project that uses them.

For example, if a method is added to the BackEndDeveloper class or Python is used instead of Java, ultimately we have to apply these changes to the Project class as well.

Additionally, the high-level classes are not reusable, meaning that if we add new personnel in other fields to our team, such as MobileDeveloper, we have to change the Project class or create a separate class for each field, which This violates the fifth principle of SOLID.

<br>

#### ✅ Well, what’s the solution?

Let’s create an `interface` for all developers that has a “develop” method, and each programmer implements that method based on their own field of work.

```dart
// Developer interface
abstract class Developer {

  void develop();
  
}

```

```dart
import 'developer.dart';

class BackEndDeveloper implements Developer {
  @override
  void develop() {
    _writeJava();
  }

  void _writeJava() {}
}
```

```dart
import 'developer.dart';

class FrontEndDeveloper implements Developer {
  @override
  void develop() {
    _writeJavaScript();
  }

  void _writeJavaScript() {}
}
```

Now our Project class can receive a list of developers and call their “develop” method without any dependencies.

```dart
import 'developer.dart';

class Project {
  final List<Developer> developers;
  Project({required this.developers});

  void implement() {
    developers.forEach((developer) => developer.develop());
  }
}
```

By doing this, we have followed the DIP principle

In this way, it doesn’t matter if the programmer is a backend, frontend, or mobile developer, and our Project class has no dependency on any of the lower-level classes or their methods.

