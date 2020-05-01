import 'package:mobx/mobx.dart';
import 'package:my_grades/stores/grade_store.dart';
import 'package:my_grades/stores/subject_list_store.dart';
part 'subject_store.g.dart';

class SubjectStore = _SubjectStore with _$SubjectStore;

abstract class _SubjectStore with Store {
  
  String name;

  @observable
  bool passed;

  @observable
  GradeStore grades;

  _SubjectStore({this.name, this.passed = false, this.grades});
  
  @action
  void checkIfPassed(double total) {
    if(total >= 15){
      passed = true;
    } else {
      passed = false;
    }
  }

  @action
  void addGrade(int trimestrer, String gradeString) {
    double grade = double.parse(gradeString);

    switch(trimestrer) {
      case 1:
        grades.trimester1 = grade;
        break;
      case 2:
        grades.trimester2 = grade;
        break;
      case 3:
        grades.trimester3 = grade;
        break;
      default:
        print("error $trimestrer, $grade");
    }

    checkIfPassed(grades.total);
  }
}