import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_grades/CONSTS.dart';
import 'package:my_grades/stores/subject_list_store.dart';
import 'package:my_grades/stores/subject_store.dart';
import 'package:my_grades/widgets/subject_home_widget.dart';
import '../db/database.dart';

class SubjectScreen extends StatefulWidget {
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  SubjectList subjectList = SubjectList();
  TextEditingController _controller = TextEditingController();
  SubjectDatabase db;

  @override
  Widget build(BuildContext context) {
    subjectList.checkSubjectsPassed();
    subjectList.getSubjectsLength();

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
                          text: subjectList.subjectsLength.toString(),
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
              Expanded(
                child: FutureBuilder(
                  future: SubjectDatabase.db.getAllSubjects(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data.length > 0) {
                      return ListView.separated(
                        itemCount: snapshot.data.length,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 15);
                        },
                        itemBuilder: (context, index) {
                          SubjectStore item = snapshot.data[index];
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
                                      "Você deseja excluir a matéria \"${item.name}\"? Tenha em mente que perderá todas as notas descritas.",
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
                                          setState(() {
                                            SubjectDatabase.db.deleteSubjectWithId(item.id);
                                            //subjectList.removeSubject(item.id);
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: SubjectHomeWidget(
                              subject: item,
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          "Não tem nenhuma matéria cadastrada!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffF8F8F2),
                            fontSize: 16,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
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
                        setState(() {
                          SubjectDatabase.db.addSubjectToDatabase(
                          SubjectStore(
                            name: _controller.text,
                            passed: false,
                            trimester1: 0.0,
                            trimester2: 0.0,
                            trimester3: 0.0,
                          ),
                        );
                        });
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
