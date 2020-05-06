import 'package:flutter/material.dart';
import 'package:my_grades/CONSTS.dart';
import 'package:my_grades/screens/grade_screen.dart';
import 'package:my_grades/stores/subject_store.dart';

class SubjectHomeWidget extends StatelessWidget {
  
  final SubjectStore subject;

  SubjectHomeWidget({this.subject});

  @override
  Widget build(BuildContext context) {

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
                  gradesText(),
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
                  "${subject.total.toStringAsFixed(2)}",
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

  String gradesText() {
    String stringTrimestrer1 = subject.trimester1 == 0.0 ? "--" : subject.trimester1.toString();
    String stringTrimestrer2 = subject.trimester1 == 0.0 ? "--" : subject.trimester2.toString();
    String stringTrimestrer3 = subject.trimester1 == 0.0 ? "--" : subject.trimester3.toString();

    return "$stringTrimestrer1 / $stringTrimestrer2 / $stringTrimestrer3";
  }
}
