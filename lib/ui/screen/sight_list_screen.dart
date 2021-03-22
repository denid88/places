import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  static const title = 'Список интересных мест';
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(SightListScreen.title),
      ),
    );
  }
}
