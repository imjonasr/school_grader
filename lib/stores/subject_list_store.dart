import 'package:mobx/mobx.dart';
import 'package:my_grades/stores/grade_store.dart';
import 'package:my_grades/stores/subject_store.dart';
part 'subject_list_store.g.dart';

class SubjectList = _SubjectListBase with _$SubjectList;

abstract class _SubjectListBase with Store {
  ObservableList<SubjectStore> subjects = ObservableList<SubjectStore>();

  @action
  void addSubject(String name) {
    subjects.add(
      SubjectStore(
        name: name,
        passed: false,
        grades: GradeStore(trimester1: 0.0, trimester2: 0.0, trimester3: 0.0),
      ),
    );
    checkSubjectsPassed();
  }

  @action
  void removeSubject(int index) {
    subjects.removeAt(index);
  }

  @observable
  int subjectsPassed = 0;

  @action
  void checkSubjectsPassed() {
    subjectsPassed = 0;
    for(int s = 0; s < subjects.length; s++) {
      if(subjects[s].passed) {
        subjectsPassed++;
      }
    }
  }
}
