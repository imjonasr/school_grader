import 'package:flutter/material.dart';
import 'package:my_grades/CONSTS.dart';
import 'package:my_grades/screens/grade_screen.dart';
import 'package:my_grades/stores/subject_store.dart';
import 'package:my_grades/stores/grade_store.dart';

class SubjectHomeWidget extends StatelessWidget {
  
  final SubjectStore subject;

  SubjectHomeWidget({this.subject});

  @override
  Widget build(BuildContext context) {

    GradeStore _grades = subject.grades;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GradeScreen(subject: subject,)),
      ),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: CONSTS.foregroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: subject.passed ? CONSTS.greenColor : CONSTS.redColor,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  subject.name,
                  style: TextStyle(
                    color: CONSTS.whiteColor,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${_grades.trimester1} - ${_grades.trimester2} - ${_grades.trimester3}",
                  style: TextStyle(
                    color: CONSTS.greyColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${_grades.total.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: CONSTS.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}
