import 'package:flutter/material.dart';
import 'package:my_grades/CONSTS.dart';
import 'package:my_grades/stores/subject_store.dart';
import 'package:my_grades/widgets/botomNavigationBar_widget.dart';
import 'package:my_grades/widgets/grades_widget.dart';

class GradeScreen extends StatelessWidget {
  final SubjectStore subject;

  GradeScreen({Key key, @required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CONSTS.backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: CONSTS.whiteColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    subject.name,
                    style: TextStyle(
                      color: CONSTS.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: CONSTS.whiteColor,
                        ),
                        onPressed: () {
                          print("Adicionar nota");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              
              Divider(
                color: CONSTS.whiteColor,
              ),
              SizedBox(
                height: 5,
              ),
              GradeWidget(subject: subject,trimester: 1,),
              GradeWidget(subject: subject,trimester: 2,),
              GradeWidget(subject: subject,trimester: 3,),
              GradeWidget(subject: subject, isTotalWidget: true,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        passed: subject.passed,
        lessToPass: subject.grades.lessToPass,
      ),
    );
  }
}
