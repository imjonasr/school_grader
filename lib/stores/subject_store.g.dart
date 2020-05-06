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

  final _$trimester1Atom = Atom(name: '_SubjectStore.trimester1');

  @override
  double get trimester1 {
    _$trimester1Atom.context.enforceReadPolicy(_$trimester1Atom);
    _$trimester1Atom.reportObserved();
    return super.trimester1;
  }

  @override
  set trimester1(double value) {
    _$trimester1Atom.context.conditionallyRunInAction(() {
      super.trimester1 = value;
      _$trimester1Atom.reportChanged();
    }, _$trimester1Atom, name: '${_$trimester1Atom.name}_set');
  }

  final _$trimester2Atom = Atom(name: '_SubjectStore.trimester2');

  @override
  double get trimester2 {
    _$trimester2Atom.context.enforceReadPolicy(_$trimester2Atom);
    _$trimester2Atom.reportObserved();
    return super.trimester2;
  }

  @override
  set trimester2(double value) {
    _$trimester2Atom.context.conditionallyRunInAction(() {
      super.trimester2 = value;
      _$trimester2Atom.reportChanged();
    }, _$trimester2Atom, name: '${_$trimester2Atom.name}_set');
  }

  final _$trimester3Atom = Atom(name: '_SubjectStore.trimester3');

  @override
  double get trimester3 {
    _$trimester3Atom.context.enforceReadPolicy(_$trimester3Atom);
    _$trimester3Atom.reportObserved();
    return super.trimester3;
  }

  @override
  set trimester3(double value) {
    _$trimester3Atom.context.conditionallyRunInAction(() {
      super.trimester3 = value;
      _$trimester3Atom.reportChanged();
    }, _$trimester3Atom, name: '${_$trimester3Atom.name}_set');
  }

  final _$totalAtom = Atom(name: '_SubjectStore.total');

  @override
  double get total {
    _$totalAtom.context.enforceReadPolicy(_$totalAtom);
    _$totalAtom.reportObserved();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.context.conditionallyRunInAction(() {
      super.total = value;
      _$totalAtom.reportChanged();
    }, _$totalAtom, name: '${_$totalAtom.name}_set');
  }

  final _$remainToPassAtom = Atom(name: '_SubjectStore.remainToPass');

  @override
  double get remainToPass {
    _$remainToPassAtom.context.enforceReadPolicy(_$remainToPassAtom);
    _$remainToPassAtom.reportObserved();
    return super.remainToPass;
  }

  @override
  set remainToPass(double value) {
    _$remainToPassAtom.context.conditionallyRunInAction(() {
      super.remainToPass = value;
      _$remainToPassAtom.reportChanged();
    }, _$remainToPassAtom, name: '${_$remainToPassAtom.name}_set');
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
  void addGrade(int trimestrer, String gradeString) {
    final _$actionInfo = _$_SubjectStoreActionController.startAction();
    try {
      return super.addGrade(trimestrer, gradeString);
    } finally {
      _$_SubjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'passed: ${passed.toString()},trimester1: ${trimester1.toString()},trimester2: ${trimester2.toString()},trimester3: ${trimester3.toString()},total: ${total.toString()},remainToPass: ${remainToPass.toString()}';
    return '{$string}';
  }
}
