import 'package:flutter/material.dart';
import 'package:prolego/homepage.dart';

void main() async {
  runApp(const Prolego());
}

class Prolego extends StatelessWidget {
  const Prolego({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Prolego Weather app",
      home: HomePage(),
    );
  }
}
