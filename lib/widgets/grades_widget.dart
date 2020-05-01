import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_grades/CONSTS.dart';
import 'package:my_grades/stores/subject_store.dart';

class GradeWidget extends StatelessWidget {
  final SubjectStore subject;
  final int trimester;
  final bool isTotalWidget;

  TextEditingController _gradeTextController = TextEditingController();

  GradeWidget(
      {@required this.subject, this.trimester, this.isTotalWidget = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isTotalWidget ? null : () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: CONSTS.foregroundColor,
            title: Text(
              "Adicionar nota",
              style: TextStyle(color: CONSTS.whiteColor),
            ),
            content: TextFormField(
              decoration: InputDecoration(
                hintText: 'Nota',
                hintStyle: TextStyle(
                  color: CONSTS.whiteColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),
              ),
              style: TextStyle(color: CONSTS.whiteColor),
              keyboardType: TextInputType.number,
              autofocus: true,
              cursorColor: CONSTS.purpleColor,
              controller: _gradeTextController,
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text(
                    "Adicionar",
                    style: TextStyle(
                      color: CONSTS.purpleColor,
                    ),
                  ),
                  onPressed: () {
                    subject.addGrade(trimester, _gradeTextController.text);
                    Navigator.pop(context);
                  }),
            ],
          );
        },
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 60,
        decoration: BoxDecoration(
          color: CONSTS.foregroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: <Widget>[
            Observer(builder: (_) {
              return Container(
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
              );
            }),
            SizedBox(
              width: 10,
            ),
            Observer(builder: (_) {
              return Text(
                isTotalWidget ? "Total" : "$trimesterª Unidade",
                style: TextStyle(
                  color: CONSTS.whiteColor,
                  fontSize: 18,
                ),
              );
            }),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Observer(builder: (_) {
                  return Text(
                    isTotalWidget
                        ? subject.grades.total.toStringAsFixed(2)
                        : trimestrerGrade(trimester).toString() == "0.0"
                            ? "--"
                            : trimestrerGrade(trimester).toStringAsFixed(2),
                    style: TextStyle(
                      color: CONSTS.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
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
