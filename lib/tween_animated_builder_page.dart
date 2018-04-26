import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class TweenAnimatedBuilderPage extends StatefulWidget {
  @override
  State createState() => _TweenAnimatedBuilderPage();
}

class _TweenAnimatedBuilderPage extends State<TweenAnimatedBuilderPage>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _animation = Tween(begin: 0.0, end: 300.0).animate(curve);

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
      body: GrowTransition(
        child: _LogoWidget(),
        animation: _animation,
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (builderContext, child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
