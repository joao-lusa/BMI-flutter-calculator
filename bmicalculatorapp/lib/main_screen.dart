import 'package:bmicalculatorapp/container_box_sexo.dart';
import 'package:bmicalculatorapp/data_container_sexo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


const activeColor = Color(0xFF566de5);
const inActiveColor = Color(0xFFffffffff);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;

  void updateBoxColor(int gender){
    if(gender == 1){
      if(maleBoxColor == inActiveColor){
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      }else{
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    }else{
      if(femaleBoxColor == inActiveColor){
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      }else{
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateBoxColor(1);
                  });
                },
                child: ContainerBoxSexo(
                boxColor: maleBoxColor,
                childWidget: DataContainerSexo(icon: FontAwesomeIcons.mars, title: 'MALE',),
            )
              )),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateBoxColor(2);
                  });
                },
                child: ContainerBoxSexo(
                boxColor: femaleBoxColor,
                childWidget: DataContainerSexo (icon: FontAwesomeIcons.venus, title: 'FEMALE',),
            )
              )),
          ])),

          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFffffff),
                 boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: Offset(0, 3),
                  ),
                ]
              ),
            ),
          ),
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
                child:Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFffffff),
                 boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: Offset(0, 3),
                  ),
                ]
              ),
            )),
            Expanded(
              child:Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFffffff),
                 boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: Offset(0, 3),
                  ),
                ]
              ),
            )),
          ])),
        ],
      ),
    );
  }
}
//22:2
