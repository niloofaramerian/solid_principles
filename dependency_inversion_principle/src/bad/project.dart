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
