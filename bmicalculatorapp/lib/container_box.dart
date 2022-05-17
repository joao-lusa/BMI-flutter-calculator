import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  final Color boxColor;
  final Widget childWidget;

  ContainerBox({required this.boxColor, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: boxColor,
  
      ),
    );
  }
}