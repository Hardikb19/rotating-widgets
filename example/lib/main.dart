import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotating_widgets/rotating_widgets.dart';

import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Revolving Widget Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            height: 420,
            width: MediaQuery.of(context).size.width/4*3,
            child: RotatingWidgetsTest(
                child : Icon(Icons.thumb_up)
            ),
          ),
        ),
      );
  }
}

// ignore: must_be_immutable
class RotatingWidgetsTest extends StatefulWidget {
  RotatingWidgetsTest({
    @required this.child
  });

  Widget child;

  @override
  _RotatingWidgetsTestState createState() => _RotatingWidgetsTestState();
}

class _RotatingWidgetsTestState extends State<RotatingWidgetsTest> {

  bool boolX;
  bool boolY;
  double _angle;

  @override
  void initState() {
    boolX = true;
    boolY = true;
    _angle = 0.01;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        boxShadow: [
          
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2,2),
            blurRadius: 2.0,
            spreadRadius: 5
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(1,1),
            blurRadius: 3.0,
            spreadRadius: 4
          ),
        ],
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width/3*2,
      height: 400.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: RotatingWidgets(
                child: CircleAvatar(
                  radius: 80,
                  child: widget.child
                ),
                angleRadian: _angle,
                rotateX: boolX,
                rotateY: boolY,
              )
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      print('tapX');
                      setState(() {
                        boolX = !boolX;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: (boolX)?Colors.blue:Colors.red,
                        child: Text(
                          'X'
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('tapY');
                      setState(() {
                        boolY = !boolY;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: (boolY)?Colors.blue:Colors.red,
                        child: Text(
                          'Y'
                        ),
                      ),
                    ),
                  ),
                  (boolX || boolY)?Container(
                    width: 80,
                    height: 60,
                    margin: EdgeInsets.all(4),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        hintText: _angle.toString()
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      onChanged: (val){
                        print(val);
                        if(val == ''){
                          setState(() {
                            _angle = 0;
                          });
                          return;
                        }
                        double value = double.parse(val) % math.pi;
                        setState(() {
                          _angle = value;
                        });
                        print(_angle);
                      },
                    ),
                  ): SizedBox.shrink()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
} 
