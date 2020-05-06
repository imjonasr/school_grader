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

  final _$subjectsLengthAtom = Atom(name: '_SubjectListBase.subjectsLength');

  @override
  int get subjectsLength {
    _$subjectsLengthAtom.context.enforceReadPolicy(_$subjectsLengthAtom);
    _$subjectsLengthAtom.reportObserved();
    return super.subjectsLength;
  }

  @override
  set subjectsLength(int value) {
    _$subjectsLengthAtom.context.conditionallyRunInAction(() {
      super.subjectsLength = value;
      _$subjectsLengthAtom.reportChanged();
    }, _$subjectsLengthAtom, name: '${_$subjectsLengthAtom.name}_set');
  }

  final _$checkSubjectsPassedAsyncAction = AsyncAction('checkSubjectsPassed');

  @override
  Future<int> checkSubjectsPassed() {
    return _$checkSubjectsPassedAsyncAction
        .run(() => super.checkSubjectsPassed());
  }

  final _$getSubjectsLengthAsyncAction = AsyncAction('getSubjectsLength');

  @override
  Future<int> getSubjectsLength() {
    return _$getSubjectsLengthAsyncAction.run(() => super.getSubjectsLength());
  }

  @override
  String toString() {
    final string =
        'subjectsPassed: ${subjectsPassed.toString()},subjectsLength: ${subjectsLength.toString()}';
    return '{$string}';
  }
}
