import 'package:flutter/material.dart';
import "dart:math";

class MyAnimatedWidget extends StatefulWidget {
  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class BlueSquareMove extends StatefulWidget {
  @override
  _BlueSquareMoveState createState() => _BlueSquareMoveState();
}

class _BlueSquareMoveState extends State<BlueSquareMove>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _widthAnimation = Tween<double>(
      begin: 1,
      end: 2,
    ).animate(_controller);
    _heightAnimation = Tween<double>(
      begin: 1,
      end: 2,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scaleX: _widthAnimation.value,
          scaleY: _heightAnimation.value,
        );
      },
      child: Container(
        color: Colors.blue,
        width: 100,
        height: 100,
      ),
    );
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.elasticOut,
      width: 100,
      height: 100,
      color: Colors.blue,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _rotationAnimation = Tween<double>(
      begin: Random().nextInt(720) - 360,
      end: 5,
    ).animate(_controller);
    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1,
    ).animate(_controller);
    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value,
              child: child,
            ),
          ),
        );
      },
      child: Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
          child: Column(children: [
        MyAnimatedWidget(),
        BlueSquareMove(),
      ])),
    );
  }
}
