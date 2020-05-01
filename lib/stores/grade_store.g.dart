// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GradeStore on _GradeStore, Store {
  Computed<double> _$totalComputed;

  @override
  double get total =>
      (_$totalComputed ??= Computed<double>(() => super.total)).value;
  Computed<double> _$remainToPassComputed;

  @override
  double get remainToPass =>
      (_$remainToPassComputed ??= Computed<double>(() => super.remainToPass))
          .value;

  final _$trimester1Atom = Atom(name: '_GradeStore.trimester1');

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

  final _$trimester2Atom = Atom(name: '_GradeStore.trimester2');

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

  final _$trimester3Atom = Atom(name: '_GradeStore.trimester3');

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

  @override
  String toString() {
    final string =
        'trimester1: ${trimester1.toString()},trimester2: ${trimester2.toString()},trimester3: ${trimester3.toString()},total: ${total.toString()},remainToPass: ${remainToPass.toString()}';
    return '{$string}';
  }
}
