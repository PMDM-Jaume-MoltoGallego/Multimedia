import 'package:flutter/material.dart';
import 'dart:math';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double _size = 100;
  double _top = 200;
  double _left = 100;
  Color _color = Colors.blue;
  double _borderRadius = 20;
  final Random _random = Random();

  void _animateBox() {
    setState(() {
      _size = _random.nextDouble() * 150 + 50;
      _top = _random.nextDouble() * 300;
      _left = _random.nextDouble() * 200;
      _color = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        1,
      );
      _borderRadius = _random.nextDouble() * 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation')),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            top: _top,
            left: _left,
            child: GestureDetector(
              onTap: _animateBox,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                width: _size,
                height: _size,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
