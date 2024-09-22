import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convertable',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 103, 58, 183)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Convertable'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _celsius = -40.0;
  double _fahrenheit = -40.0;

  final TextEditingController _celsiusController = TextEditingController();
  final TextEditingController _fahrenheitController = TextEditingController();

  void _cChanged(String value) async {
    // Convert the input value to a double
    _celsius = double.tryParse(value) ?? 0.0;
    // Convert Celsius to Fahrenheit
    _fahrenheit = (_celsius * 9 / 5) + 32;
    _fahrenheitController.text = _fahrenheit.toStringAsFixed(2);
  }

  void _fChanged(String value) async {
    // Convert the input value to a double
    _fahrenheit = double.tryParse(value) ?? 0.0;
    // Convert Fahrenheit to Celsius
    _celsius = (_fahrenheit - 32) * 5 / 9;
    _celsiusController.text = _celsius.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(64.0),
                child: const DropdownMenu(
                  dropdownMenuEntries: <DropdownMenuEntry>[
                    DropdownMenuEntry(value: 0, label: "Temperature"),
                    // DropdownMenuEntry(value: 1, label: "Distance"),
                    // DropdownMenuEntry(value: 2, label: "Volume"),
                    // DropdownMenuEntry(value: 3, label: "Weight"),
                    // DropdownMenuEntry(value: 4, label: "Time")
                  ],
                  initialSelection: 0,
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    SizedBox(
                        width: 120.0,
                        height: 64.0,
                        child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _celsiusController,
                            onChanged: _cChanged,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()))),
                    const Padding(
                        padding: EdgeInsets.only(left: 10.0), child: Text('°C'))
                  ]),
                  const Text('<->'),
                  Row(children: <Widget>[
                    SizedBox(
                        width: 120.0,
                        child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _fahrenheitController,
                            onChanged: _fChanged,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()))),
                    const Padding(
                        padding: EdgeInsets.only(left: 10.0), child: Text('°F'))
                  ])
                ])
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
