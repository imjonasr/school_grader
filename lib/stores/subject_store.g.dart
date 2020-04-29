// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectStore on _SubjectStore, Store {
  final _$passedAtom = Atom(name: '_SubjectStore.passed');

  @override
  bool get passed {
    _$passedAtom.context.enforceReadPolicy(_$passedAtom);
    _$passedAtom.reportObserved();
    return super.passed;
  }

  @override
  set passed(bool value) {
    _$passedAtom.context.conditionallyRunInAction(() {
      super.passed = value;
      _$passedAtom.reportChanged();
    }, _$passedAtom, name: '${_$passedAtom.name}_set');
  }

  final _$gradesAtom = Atom(name: '_SubjectStore.grades');

  @override
  GradeStore get grades {
    _$gradesAtom.context.enforceReadPolicy(_$gradesAtom);
    _$gradesAtom.reportObserved();
    return super.grades;
  }

  @override
  set grades(GradeStore value) {
    _$gradesAtom.context.conditionallyRunInAction(() {
      super.grades = value;
      _$gradesAtom.reportChanged();
    }, _$gradesAtom, name: '${_$gradesAtom.name}_set');
  }

  final _$_SubjectStoreActionController =
      ActionController(name: '_SubjectStore');

  @override
  void checkIfPassed(double total) {
    final _$actionInfo = _$_SubjectStoreActionController.startAction();
    try {
      return super.checkIfPassed(total);
    } finally {
      _$_SubjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'passed: ${passed.toString()},grades: ${grades.toString()}';
    return '{$string}';
  }
}
