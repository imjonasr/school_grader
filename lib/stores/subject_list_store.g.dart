// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectList on _SubjectListBase, Store {
  final _$subjectsPassedAtom = Atom(name: '_SubjectListBase.subjectsPassed');

  @override
  int get subjectsPassed {
    _$subjectsPassedAtom.context.enforceReadPolicy(_$subjectsPassedAtom);
    _$subjectsPassedAtom.reportObserved();
    return super.subjectsPassed;
  }

  @override
  set subjectsPassed(int value) {
    _$subjectsPassedAtom.context.conditionallyRunInAction(() {
      super.subjectsPassed = value;
      _$subjectsPassedAtom.reportChanged();
    }, _$subjectsPassedAtom, name: '${_$subjectsPassedAtom.name}_set');
  }

  final _$_SubjectListBaseActionController =
      ActionController(name: '_SubjectListBase');

  @override
  void addSubject(String name) {
    final _$actionInfo = _$_SubjectListBaseActionController.startAction();
    try {
      return super.addSubject(name);
    } finally {
      _$_SubjectListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSubject(int index) {
    final _$actionInfo = _$_SubjectListBaseActionController.startAction();
    try {
      return super.removeSubject(index);
    } finally {
      _$_SubjectListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkSubjectsPassed() {
    final _$actionInfo = _$_SubjectListBaseActionController.startAction();
    try {
      return super.checkSubjectsPassed();
    } finally {
      _$_SubjectListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'subjectsPassed: ${subjectsPassed.toString()}';
    return '{$string}';
  }
}
