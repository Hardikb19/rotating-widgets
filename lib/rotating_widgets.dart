library rotating_widgets;

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RotatingWidgets extends StatefulWidget {
  RotatingWidgets(
      {@required this.child,
      this.rotateX = true,
      this.rotateY = true,
      this.angleRadian = 0.01});

  Widget child;
  bool rotateX;
  bool rotateY;
  double angleRadian;

  @override
  _RotatingWidgetsState createState() => _RotatingWidgetsState();
}

class _RotatingWidgetsState extends State<RotatingWidgets> {
  Offset _offset;

  @override
  void initState() {
    _offset = Offset.zero;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX((widget.rotateX) ? (widget.angleRadian * _offset.dy) : 0)
          ..rotateY(
              (widget.rotateY) ? (widget.angleRadian * -1 * _offset.dx) : 0),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: widget.child,
        ));
  }
}
