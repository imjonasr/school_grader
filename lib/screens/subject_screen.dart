import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_grades/CONSTS.dart';
import 'package:my_grades/stores/subject_list_store.dart';
import 'package:my_grades/widgets/subject_home_widget.dart';

class SubjectScreen extends StatefulWidget {
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  //List<SubjectStore> subjects = [];
  SubjectList subjectList = SubjectList();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var subjects = subjectList.subjects;

    return Scaffold(
      backgroundColor: Color(0xff282A36),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Grades",
                style: TextStyle(
                  color: Color(0xffF8F8F2),
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                ),
              ),
              Observer(builder: (_) {
                return RichText(
                  text: TextSpan(
                      text: "Passado em ",
                      style: TextStyle(
                        color: Color(0xffF8F8F2),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "X",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: " de "),
                        TextSpan(
                          text: subjects.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: " matérias."),
                      ]),
                );
              }),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Color(0xffF8F8F2),
              ),
              SizedBox(
                height: 5,
              ),
              Observer(builder: (_) {
                return Expanded(
                  child: subjects.length == 0
                      ? Center(
                          child: Text(
                            "Não tem nenhuma matéria cadastrada!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffF8F8F2),
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: subjects.length,
                          itemBuilder: (context, index) {
                            return SubjectHomeWidget(
                              subject: subjects[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 15);
                          },
                        ),
                );
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(
            Icons.add,
            color: CONSTS.whiteColor,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Adicionar matéria"),
                  content: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    autofocus: true,
                    cursorColor: CONSTS.purpleColor,
                    controller: _controller,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Adicionar"),
                      onPressed: () {
                        subjectList.addSubject(_controller.text);
                        _controller.text = "";
                        Navigator.pop(context, _controller.text);
                      },
                    )
                  ],
                );
              },
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
