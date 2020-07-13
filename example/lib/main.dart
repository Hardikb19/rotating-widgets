import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotating_widgets/rotating_widget.dart';

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
      home: MyHomePage(title: 'Rotating Widget Example'),
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
          height: 520,
          width: MediaQuery.of(context).size.width / 5 * 4,
          child: RotatingWidgetsTest(child: Icon(Icons.thumb_up)),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RotatingWidgetsTest extends StatefulWidget {
  RotatingWidgetsTest({@required this.child});

  Widget child;

  @override
  _RotatingWidgetsTestState createState() => _RotatingWidgetsTestState();
}

class _RotatingWidgetsTestState extends State<RotatingWidgetsTest> {
  bool boolX;
  bool boolY;
  bool boolZ;
  bool autoplay;
  double _angle;

  @override
  void initState() {
    boolX = true;
    boolY = true;
    boolZ = false;
    autoplay = false;
    _angle = 0.01;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(2, 2),
              blurRadius: 2.0,
              spreadRadius: 5),
          BoxShadow(
              color: Colors.white,
              offset: Offset(1, 1),
              blurRadius: 3.0,
              spreadRadius: 4),
        ],
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: 500.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              color: Color.fromRGBO(240, 240, 240, 1),
              child: Center(
                child: SizedBox(
                    height: 200.0,
                    width: 200.0,
                    child: RotatingWidget(
                      child: CircleAvatar(radius: 80, child: widget.child),
                      angleRadianX: _angle,
                      rotateX: boolX,
                      rotateY: boolY,
                      angleRadianY: _angle * 2,
                      angleRadianZ: _angle * 4,
                      autoplay: autoplay,
                      duration: Duration(milliseconds: 1),
                      rotateZ: boolZ,
                    )),
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        boolX = !boolX;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: (boolX) ? Colors.blue : Colors.red,
                        child: Text('X'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //print('tapY');
                      setState(() {
                        boolY = !boolY;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: (boolY) ? Colors.blue : Colors.red,
                        child: Text('Y'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      //print('tapZ');
                      setState(() {
                        boolZ = !boolZ;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: (boolZ) ? Colors.blue : Colors.red,
                        child: Text('Z'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        autoplay = !autoplay;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: (autoplay) ? Colors.blue : Colors.red,
                        child: Icon(Icons.play_arrow),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            (boolX || boolY || boolZ)
                ? Container(
                    width: 90,
                    height: 50,
                    margin: EdgeInsets.all(4),
                    child: TextField(
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: _angle.toString()),
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true, signed: true),
                      onChanged: (val) {
                        //print(val);
                        if (val == '') {
                          setState(() {
                            _angle = 0;
                          });
                          return;
                        }
                        double value = double.parse(val) % math.pi;
                        setState(() {
                          _angle = value;
                        });
                        //print(_angle);
                      },
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
