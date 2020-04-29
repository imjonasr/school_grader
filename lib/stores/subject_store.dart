import 'package:mobx/mobx.dart';
import 'package:my_grades/stores/grade_store.dart';
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
}