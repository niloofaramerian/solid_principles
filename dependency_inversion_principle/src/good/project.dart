import 'developer.dart';

class Project {
  final List<Developer> developers;
  Project({required this.developers});

  void implement() {
    developers.forEach((developer) => developer.develop());
  }
}
