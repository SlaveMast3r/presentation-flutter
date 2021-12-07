import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HelloWorldPage(),
    );
  }
}

class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello world",
        ),
      ),
    );
  }
}
