import 'package:flutter/material.dart';
import 'package:my_grades/CONSTS.dart';
import 'package:my_grades/stores/subject_store.dart';

class GradeWidget extends StatelessWidget {
  final SubjectStore subject;
  final int trimester;
  final bool isTotalWidget;

  GradeWidget(
      {@required this.subject, this.trimester, this.isTotalWidget = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 60,
        decoration: BoxDecoration(
          color: CONSTS.foregroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isTotalWidget
                    ? subject.grades.total > 15.0
                        ? CONSTS.greenColor
                        : CONSTS.redColor
                    : trimestrerGrade(trimester) > 5.0
                        ? CONSTS.greenColor
                        : CONSTS.redColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              width: 10,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              isTotalWidget ? "Total" : "$trimesterª Unidade",
              style: TextStyle(
                color: CONSTS.whiteColor,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  isTotalWidget
                      ? subject.grades.total.toString()
                      : trimestrerGrade(trimester).toString() == "0.0"
                          ? "--"
                          : trimestrerGrade(trimester).toString(),
                  style: TextStyle(
                    color: CONSTS.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }

  double trimestrerGrade(int trimester) {
    switch (trimester) {
      case 1:
        return subject.grades.trimester1;
        break;
      case 2:
        return subject.grades.trimester2;
        break;
      case 3:
        return subject.grades.trimester3;
        break;
      default:
        return 0.0;
        break;
    }
  }
}
