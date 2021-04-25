import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotating_widget_test/rotating_widgets.dart';

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
  MyHomePage({Key? key, required this.title}) : super(key: key);

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

class RotatingWidgetsTest extends StatefulWidget {
  RotatingWidgetsTest({required this.child});

  final Widget child;

  @override
  _RotatingWidgetsTestState createState() => _RotatingWidgetsTestState();
}

class _RotatingWidgetsTestState extends State<RotatingWidgetsTest> {
  late bool boolX;
  late bool boolY;
  late bool boolZ;
  late double _angle;
  RotatingWidgetsController rwc = RotatingWidgetsController(autoplayEnabled: true);

  @override
  void initState() {
    boolX = true;
    boolY = true;
    boolZ = false;
    _angle = 0.01;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, offset: Offset(2, 2), blurRadius: 2.0, spreadRadius: 5),
            BoxShadow(color: Colors.white, offset: Offset(1, 1), blurRadius: 3.0, spreadRadius: 4),
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
                        controller: rwc,
                        rotateX: boolX,
                        rotateY: boolY,
                        rotateZ: boolZ,
                        angleRadianX: _angle,
                        angleRadianY: _angle * 2.0,
                        angleRadianZ: _angle * 4.0,
                        duration: Duration(milliseconds: 1),
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
                          _angle = 0.01;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: (boolX) ? Colors.green : Colors.grey,
                          child: Text('X'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          boolY = !boolY;
                          _angle = 0.01;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: (boolY) ? Colors.green : Colors.grey,
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
                        setState(() {
                          boolZ = !boolZ;
                          _angle = 0.01;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: (boolZ) ? Colors.green : Colors.grey,
                          child: Text('Z'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                          rwc.toggleAutoplay();
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: ValueListenableBuilder(
                          valueListenable: rwc.autoplay,
                          builder: (_, bool newValue, ___) {
                            return CircleAvatar(
                              radius: 25.0,
                              backgroundColor: (rwc.getAutoplay) ? Colors.green : Colors.grey,
                              child: Icon(Icons.play_arrow),
                            );
                          },
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
                        keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                        onChanged: (val) {
                          if (val == '') {
                            setState(() {
                              _angle = 0.0;
                            });
                            return;
                          }
                          double value = double.tryParse(val) ?? 0.0 % math.pi;
                          setState(() {
                            _angle = value;
                          });
                        },
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
