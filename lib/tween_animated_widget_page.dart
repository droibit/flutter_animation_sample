import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TweenAnimatedWidgetPage extends StatefulWidget {
  @override
  State createState() => _TweenAnimatedWidgetPageState();
}

class _TweenAnimatedWidgetPageState extends State<TweenAnimatedWidgetPage>
    with TickerProviderStateMixin {
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
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
        print('animation status: $status');
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
      body: _AnimatedLogo(animation: _animation),
    );
  }
}

class _AnimatedLogo extends AnimatedWidget {
  const _AnimatedLogo({
    Key key,
    @required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
