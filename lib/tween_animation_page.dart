import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class TweenAnimationPage extends StatefulWidget {
  @override
  State createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = Tween(
      begin: 0.0,
      end: 300.0,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: _animation.value,
          width: _animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
