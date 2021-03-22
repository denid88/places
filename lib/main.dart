import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFirstWidget(text: 'Stateless widget')
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('-Build MyApp-');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySecondWidget()
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  final String text;
  MyFirstWidget({this.text});

  @override
  Widget build(BuildContext context) {

    print('Build MyFirstWidget!');
    int _counter = 0;
    print(_counter);
    return Container(
      child: Center(
        child: Text(text),
      ),
    );
  }
}

class MySecondWidget extends StatefulWidget {
  @override
  _MySecondWidgetState createState() => _MySecondWidgetState();
}

class _MySecondWidgetState extends State<MySecondWidget> {

  getContent() {
    return context.runtimeType;
  }

  @override
  void initState() {
    super.initState();
    print('init state');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant MySecondWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('Build MySecondWidget!');
    int _counter = 0;
    print(_counter);
    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
