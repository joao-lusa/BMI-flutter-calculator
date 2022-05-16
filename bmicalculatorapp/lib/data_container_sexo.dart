import 'package:flutter/cupertino.dart';

class DataContainerSexo extends StatelessWidget {

  static const textStyle1 = TextStyle(
    color: Color(0xFF0000000),
    fontSize: 20.0,
  );
  final IconData icon;
  final String title;

  DataContainerSexo({required this.icon, required this.title,});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          title,
          style: textStyle1
        ),
      ],
    );
  }
}