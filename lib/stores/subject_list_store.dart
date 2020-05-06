import 'package:mobx/mobx.dart';
import 'package:my_grades/stores/subject_store.dart';
import 'package:my_grades/db/database.dart';
part 'subject_list_store.g.dart';


class SubjectList = _SubjectListBase with _$SubjectList;

abstract class _SubjectListBase with Store {
  ObservableList<SubjectStore> subjects = ObservableList<SubjectStore>();

  @observable
  int subjectsPassed = 0;

  @observable
  int subjectsLength = 0;

  @action
  Future<int> checkSubjectsPassed() async {
    subjectsPassed = 0;
    List subjects = await SubjectDatabase.db.getAllSubjects();
    for (int s = 0; s < subjects.length; s++) {
      if (subjects[s].passed) {
        subjectsPassed++;
      }
    }

    return subjectsPassed;
  }

  @action
  Future<int> getSubjectsLength() async {
    List subjects = await SubjectDatabase.db.getAllSubjects();
    subjectsLength = subjects.length;
    print(subjectsLength);
    return subjectsLength;
  }
}
