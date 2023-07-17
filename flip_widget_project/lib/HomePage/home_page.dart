import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: flipCardWidget(),
    );
  }

  Widget flipCardWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0015)
              ..rotateY(pi * _animation.value),
            child: Card(
              child: _animation.value <= 0.5
                  ? frontAreaWidget()
                  : backAreaWidget(),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              if (_status == AnimationStatus.dismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  Widget frontAreaWidget() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.amber,
      child: const Center(
        child: Text('Çağatay Öney'),
      ),
    );
  }

  Widget backAreaWidget() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.green,
        child: const Center(
          child: Text('Mobile Application Developer'),
        ),
      ),
    );
  }
}
