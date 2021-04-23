import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  double _isPosition = 0;
  double _isPositionAfter = 0;
  double _isMoveDistance = 100;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _isPositionAfter = _isPositionAfter - _isMoveDistance;
          print(_isPosition);
          print(_isPositionAfter);
          _animationController.forward();
          // _isPosition = _isPositionAfter;
        },
        child: const Icon(Icons.arrow_circle_up),
      ),
      body: Stack(
        children: [
          PositionedTransition(
            rect: _animationController
                .drive(
                  CurveTween(
                    curve: Curves.easeIn,
                  ),
                )
                .drive(
                  RelativeRectTween(
                    begin: RelativeRect.fromLTRB(0, 0, 330, _isPosition),
                    end: RelativeRect.fromLTRB(0, 0, 330, _isPositionAfter),
                  ),
                ),
            child: Image.asset(
              'assets/images/back_1.png',
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
