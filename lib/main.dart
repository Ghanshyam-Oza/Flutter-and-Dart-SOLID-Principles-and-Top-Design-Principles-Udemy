// import 'package:design_pattern/adapter_pattern/my_adapter_home_page.dart';
// import 'package:design_pattern/observer_design_pattern/exercises/set_state_home.dart';
// import 'package:design_pattern/observer_design_pattern/stream_home.dart';
import 'package:design_pattern/john_conway_game_of_life/game_of_life.dart';
import 'package:design_pattern/pages/log_message_page.dart';
import 'package:design_pattern/pages/show_audit_page.dart';
import 'package:design_pattern/sequence_generator.dart';
// import 'package:design_pattern/state_design_pattern/exercises/media_player_home.dart';
// import 'package:design_pattern/state_design_pattern/exercises/text_editor_home.dart';
// import 'package:design_pattern/state_design_pattern/state_pattern_home.dart';
// import 'package:design_pattern/stratergy_pattern/exercises/shipping_home_page.dart';
// import 'package:design_pattern/stratergy_pattern/stratergy_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Design Patterns'),
      // home: const MyAdapterHomePage(title: "Adapter Pattern"),
      // home: const StratergyHomePage(),
      // home: const ShippingHome(),
      // home: const SetStateHome(title: "Observer Pattern"),
      // home: const StreamHomePage(),
      // home: const StatePatternHome(),
      // home: const MediaPlayerHome(),
      // home: const TextEditorHome(),
      home: const GameOfLife(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Solid Principles, Design Principles"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "tab1"),
              Tab(text: "tab2"),
              Tab(text: "tab3"),
              Tab(text: 'Show Audit Message')
            ],
          ),
        ),
        body: const TabBarView(children: [
          LogMessagePage(),
          LogMessagePage(),
          LogMessagePage(),
          ShowAuditFilePage(),
        ]),
      ),
    );
  }
}

class Widget1 extends StatefulWidget {
  const Widget1({super.key});

  @override
  State<Widget1> createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
  void _incrementCounter() {
    setState(() {
      SequenceGenerator().incrementNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${SequenceGenerator().getCurrentNumber()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Widget2 extends StatefulWidget {
  const Widget2({super.key});

  @override
  State<Widget2> createState() => _Widget2State();
}

class _Widget2State extends State<Widget2> {
  void _incrementCounter() {
    setState(() {
      SequenceGenerator().incrementNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${SequenceGenerator().getCurrentNumber()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Widget3 extends StatefulWidget {
  const Widget3({super.key});

  @override
  State<Widget3> createState() => _Widget3State();
}

class _Widget3State extends State<Widget3> {
  void _incrementCounter() {
    setState(() {
      SequenceGenerator().incrementNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '${SequenceGenerator().getCurrentNumber()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
