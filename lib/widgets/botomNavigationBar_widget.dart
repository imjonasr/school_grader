import 'package:flutter/material.dart';
import 'package:my_grades/CONSTS.dart';

class BottomNavigationBarWidget extends StatelessWidget {

  final bool passed;
  final double lessToPass;

  BottomNavigationBarWidget({@required this.passed, @required this.lessToPass});

  @override
  Widget build(BuildContext context) {
    return passed == true 
    ? Container(
      height: 50,
      color: CONSTS.greenColor,
      child: Center(
        child: Text(
          "Passado",
          style: TextStyle(
            color: CONSTS.whiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    )
    : Container(
      height: 50,
      color: CONSTS.redColor,
      child: Center(
        child: Text(
          "Faltam $lessToPass pontos",
          style: TextStyle(
            color: CONSTS.whiteColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
