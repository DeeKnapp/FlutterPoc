import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key key,
    this.color: Colors.blueAccent,
    this.child,
  }) : super(key: key);

  final Color color;

  final Widget child;

  static const IconData time_to_leave = IconData(
      0xe62c, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      body: Container(
        child: Icon(time_to_leave),
      ),
    );
  }
}
