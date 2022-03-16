import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'exercice 1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ), routes: {
      '/': (context) => MyHomePage(title: "Counter page"),
      '/helloworld': (context) => HelloWorld()
    }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  void _incrementCounter() {
    //On verifie que le valeur depasse 10

    if (_counter >= 10) {
      setState(() {
        _counter = 0;
      });
      Navigator.pushNamed(context, '/helloworld');
      return;
    }
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FloatingActionButton(
              onPressed: _decreaseCounter,
              tooltip: 'decrease',
              child: const Icon(Icons.remove),
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,

            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Hello world"),
              FloatingActionButton(
                onPressed: () {

                  Navigator.pop(context);
                },
                child: const Text('Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
