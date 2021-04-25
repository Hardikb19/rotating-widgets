library rotating_widgets;

import 'dart:async';

import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  /// `RotatingWidget` with customizable option to allow rotation across `X-Axis`, `Y-Axis` and `Z-axis`
  /// change the `angle(in radian)` by which rotation along each axis occurs.
  ///
  /// `NOTE:`
  /// Example:
  ///
  /// ```
  /// RotatingWidget(
  ///   rotateX: true,
  ///   rotateY: false,
  ///   rotateZ: false,
  ///   autoplay: true,
  /// )
  /// ```
  ///
  /// Rotation occurs only on X-Axis on `autoplay`
  ///
  RotatingWidget(
      { required this.child,
        this.rotateX = true,
        this.rotateY = true,
        this.rotateZ = false,
        this.autoplay = false,
        this.duration = const Duration(seconds: 1),
        this.angleRadianX = 0.01,
        this.angleRadianY = 0.01,
        this.angleRadianZ = 0.01});

  /// [child] refers the `widget` being turned into a rotate-able widget
  final Widget child;

  /// [rotateX] is a [boolean] for whether the widget should rotate around X-Axis
  /// `NOTE:` if [autoplay] is [true], manual rotation will be disabled
  ///
  /// But user can use these flags to limit rotation axis on `autoplay` as well

  final bool rotateX;

  /// [rotateY] is a [boolean] for whether the widget should rotate around Y-Axis
  /// `NOTE:` if [autoplay] is [true], manual rotation will be disabled
  ///
  /// But user can use these flags to limit rotation axis on `autoplay` as well
  final bool rotateY;

  /// [rotateZ] is a [boolean] for whether the widget should rotate around Z-Axis
  /// `NOTE:` if [autoplay] is [true], manual rotation will be disabled
  ///
  /// But user can use these flags to limit rotation axis on `autoplay` as well
  final bool rotateZ;

  /// [autoplay] is a [boolean] to check whether widget should rotate automatically or not
  ///
  /// Autoplay is limited to axis allowed by the user, i.e. rotation along Axis depends on `rotateX`,`rotateY`,`rotateZ`
  ///
  /// `NOTE:` if [autoplay] is [true], manual rotation will be disabled
  final bool autoplay;

  /// The [angleRadianX] refers to angle by which widget turns across X-Axis, per unit [Offset] along that axis
  /// if [autoplay] is false, or per unit [duration] is autoplay is true
  final double angleRadianX;

  /// The [angleRadianY] refers to angle by which widget turns across Y-Axis, per unit [Offset] along that axis
  /// if [autoplay] is false, or per unit [duration] is autoplay is true
  final double angleRadianY;

  /// The [angleRadianZ] refers to angle by which widget turns across Z-Axis, per unit [Offset] along both axis
  /// if [autoplay] is false, or per unit [duration] is autoplay is true
  final double angleRadianZ;

  /// The [duration] refers to the duration between which said [widget] rotates around individual axis by said angle
  final Duration duration;

  @override
  _RotatingWidgetState createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget> {
  late Offset _offset;
  late Offset _animationOffset;

  @override
  void initState() {
    _offset = Offset.zero;
    _animationOffset = checkDuration();
    _animationSequence();
    super.initState();
  }

  Offset checkDuration() {
    int microseconds = widget.duration.inMicroseconds ~/ 500;
    return Offset(
        widget.angleRadianX / microseconds, widget.angleRadianY / microseconds);
  }

  _animationSequence() {
    Timer.periodic(Duration(microseconds: 500), (val) {
      if (widget.autoplay)
        setState(() {
          _offset += _animationOffset;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (!widget.autoplay) setState(() => _offset += details.delta);
        print(details.delta);
      },
      onDoubleTap: () {
        if (!widget.autoplay) setState(() => _offset = Offset.zero);
      },
      child: _TransformWidgets(child: widget.child)
        ..rotateXAxis((widget.angleRadianX * _offset.dy), widget.rotateX)
        ..rotateYAxis((widget.angleRadianY * -1 * _offset.dx), widget.rotateY)
        ..rotateZAxis(
            (widget.angleRadianY * -1 * _offset.distance), widget.rotateZ),
    );
  }
}

// ignore: must_be_immutable
class _TransformWidgets extends StatefulWidget {
  _TransformWidgets({required this.child}):
    this.dispX = 0,
    this.dispY = 0,
    this.dispZ = 0;

  Widget child;
  double dispX;
  double dispY;
  double dispZ;

  void rotateXAxis(double _dispX, bool rotateX) {
    if (rotateX) {
      dispX = _dispX;
    }
  }

  void rotateYAxis(double _dispY, bool rotateY) {
    if (rotateY) {
      dispY = _dispY;
    }
  }

  void rotateZAxis(double _dispZ, bool rotateZ) {
    if (rotateZ) {
      dispZ = _dispZ;
    }
  }

  @override
  _TransformWidgetsState createState() => _TransformWidgetsState();
}

class _TransformWidgetsState extends State<_TransformWidgets> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(widget.dispX)
        ..rotateY(widget.dispY)
        ..rotateZ(widget.dispZ),
      alignment: FractionalOffset.center,
      child: widget.child,
    );
  }
}
