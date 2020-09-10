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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    debugPrint('Method: initState');
    setState(() => _isLoading = true);
    debugPrint('Time is ${DateTime.now()}');
    Future.delayed(Duration(seconds: 5), () {
      debugPrint('Time is ${DateTime.now()}');
      setState(() => _isLoading = false);
    });
  }

  Widget loadingIndicatorWidget() {
    if (_isLoading == true) {
      debugPrint('return Container() with loading indicator');
      return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: CircularProgressIndicator()));
    }
    debugPrint('return empty Container()');
    return Container(height: 0.0);
  }

  Widget formWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            initialValue: 'Correo',
          ),
          TextFormField(
            initialValue: 'Mensaje',
          ),
          RaisedButton(
            child: Text('Enviar'),
            onPressed: () => debugPrint('Button pressed!')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Method: build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          formWidget(),
          loadingIndicatorWidget(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
