import 'package:mobx/mobx.dart';
import '../db/database.dart';
part 'subject_store.g.dart';

class SubjectStore = _SubjectStore with _$SubjectStore;

abstract class _SubjectStore with Store {
  _SubjectStore({
    this.id,
    this.name,
    this.passed = false,
    this.trimester1 = 0.0,
    this.trimester2 = 0.0,
    this.trimester3 = 0.0,
    this.total = 0.0,
    this.remainToPass = 15.0,
  });

  int id;

  String name;

  @observable
  bool passed;

  @observable
  double trimester1;

  @observable
  double trimester2;

  @observable
  double trimester3;

  @observable
  double total;

  @observable
  double remainToPass;

  @action
  void checkIfPassed(double total) {
    if (total >= 15) {
      passed = true;
      remainToPass = 0.0;
    } else {
      passed = false;
    }
  }

  @action
  void addGrade(int trimestrer, String gradeString) {
    double grade = double.parse(gradeString);

    switch (trimestrer) {
      case 1:
        trimester1 = grade;
        break;
      case 2:
        trimester2 = grade;
        break;
      case 3:
        trimester3 = grade;
        break;
      default:
        print("error $trimestrer, $grade");
    }
    total = trimester1 + trimester2 + trimester3;
    remainToPass = 15 - total;

    checkIfPassed(total);

    SubjectDatabase.db.updateSubject(SubjectStore(
      id: id,
      name: name,
      trimester1: trimester1,
      trimester2: trimester2,
      trimester3: trimester3,
      remainToPass: remainToPass,
      total: total,
      passed: passed,
    ));
  }

  void removeSubject(int index) {
    SubjectDatabase.db.deleteSubjectWithId(index);
    SubjectDatabase.db.getAllSubjects();
  }



  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "name": name,
      "passed": passed == true ? 1 : 0,
      "trimester1": trimester1,
      "trimester2": trimester2,
      "trimester3": trimester3,
      "total": total,
      "remainToPass": remainToPass,
    };

    return map;
  }

  _SubjectStore.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    passed = json["passed"] == 1;
    trimester1 = json["trimester1"];
    trimester2 = json["trimester2"];
    trimester3 = json["trimester3"];
    total = json["total"];
    remainToPass = json["remainToPass"];
  }
}
