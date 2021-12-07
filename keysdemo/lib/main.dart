import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Keys DEMO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KeyDemoPage(),
    );
  }
}

class KeyDemoPage extends StatefulWidget {
  const KeyDemoPage({Key? key}) : super(key: key);

  @override
  _KeyDemoPageState createState() => _KeyDemoPageState();
}

class _KeyDemoPageState extends State<KeyDemoPage> {
  List<Widget> statelessWidgets = [
    StatelessColor(index: 1),
    StatelessColor(index: 2),
  ];

  List<Widget> statefullWithoutKey = [
    const StatefulColor(index: 1),
    const StatefulColor(index: 2),
  ];

  List<Widget> statefullWithKey = [
    StatefulColor(key: UniqueKey(), index: 1),
    StatefulColor(key: UniqueKey(), index: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("statelessWidgets:"),
            Row(
              children: statelessWidgets,
            ),
            const SizedBox(height: 8),
            const Text("statefulWidget:"),
            Row(
              children: statefullWithoutKey,
            ),
            const SizedBox(height: 8),
            const Text("statefulWidget + key:"),
            Row(
              children: statefullWithKey,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapColors,
        child: const Icon(Icons.change_circle),
      ),
    );
  }

  swapColors() {
    setState(() {
      statelessWidgets.insert(1, statelessWidgets.removeAt(0));
      statefullWithoutKey.insert(1, statefullWithoutKey.removeAt(0));
      statefullWithKey.insert(1, statefullWithKey.removeAt(0));
    });
  }
}

class StatelessColor extends StatelessWidget {
  StatelessColor({Key? key, required this.index}) : super(key: key);

  final int index;

  final Color color =
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2;

    return Container(
      width: size,
      height: 100,
      color: color,
      child: Center(
        child: Text(
          "$index",
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class StatefulColor extends StatefulWidget {
  const StatefulColor({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _StatefulColorState createState() => _StatefulColorState();
}

class _StatefulColorState extends State<StatefulColor> {
  final Color color =
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  late int localIndex;

  @override
  void initState() {
    localIndex = widget.index;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2;

    return Container(
      width: size,
      height: 100,
      color: color,
      child: Center(
        child: Text(
          "$localIndex",
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
