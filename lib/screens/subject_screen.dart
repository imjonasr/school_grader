import 'package:flutter/cupertino.dart';
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

  SubjectList subjectList = SubjectList();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var subjects = subjectList.subjects;
    subjectList.checkSubjectsPassed();

    return Scaffold(
      backgroundColor: Color(0xff282A36),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Notas",
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
                          text: subjectList.subjectsPassed.toString(),
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
                color: CONSTS.whiteColor,
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
                            //() =>
                            return GestureDetector(
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: CONSTS.foregroundColor,
                                      title: Text(
                                        "Excluir matéria",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: CONSTS.whiteColor,
                                        ),
                                      ),
                                      content: Text(
                                        "Você deseja excluir a matéria \"${subjects[index].name}\"? Tenha em mente que perderá todas as notas descritas.",
                                        style: TextStyle(
                                          color: CONSTS.whiteColor,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style: TextStyle(
                                              color: CONSTS.greyColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            subjectList.removeSubject(index);
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Excluir",
                                            style: TextStyle(
                                              color: CONSTS.redColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            subjectList.removeSubject(index);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SubjectHomeWidget(
                                subject: subjects[index],
                              ),
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
                  backgroundColor: CONSTS.foregroundColor,
                  title: Text(
                    "Adicionar matéria",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CONSTS.whiteColor,
                    ),
                  ),
                  content: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nome da matéria',
                      hintStyle: TextStyle(
                        color: CONSTS.whiteColor,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                    ),
                    style: TextStyle(color: CONSTS.whiteColor),
                    textCapitalization: TextCapitalization.words,
                    autofocus: true,
                    cursorColor: CONSTS.purpleColor,
                    controller: _controller,
                    maxLength: 13,
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
