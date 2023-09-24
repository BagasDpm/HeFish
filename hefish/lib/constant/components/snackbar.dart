import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void snackBarMessage(var str, BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  final snackBar = SnackBar(
    content: Text(str),
    backgroundColor: Color(0xFF00416a),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
