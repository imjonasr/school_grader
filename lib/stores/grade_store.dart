import 'package:mobx/mobx.dart';
part 'grade_store.g.dart';

class GradeStore = _GradeStore with _$GradeStore;

abstract class _GradeStore with Store {

  @observable
  double trimester1;

  @observable
  double trimester2;

  @observable
  double trimester3;

  _GradeStore({this.trimester1 = 0.0, this.trimester2 = 0.0, this.trimester3 = 0.0});

  @computed
  double get total => trimester1 + trimester2 + trimester3;

  @computed
  double get remainToPass => 15 - total;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      "trimester1": trimester1,
      "trimester2": trimester2,
      "trimester3": trimester3,
      "total": total,
      "remainToPass": remainToPass,
    };

    return map;
  }
}