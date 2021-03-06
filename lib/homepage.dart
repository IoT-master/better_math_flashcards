import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'dart:math';

import 'sum_answer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  final int _firstNumber = Random().nextInt(9);
  final int _secondNumber = Random().nextInt(9);
  void _incrementCounter() {
    // print('Floating Action + Button Pressed');
    setState(() {});
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          children: [
            TeXView(
              child: TeXViewColumn(children: [
                TeXViewDocument(
                    '\$\$ \\underline{\\begin{matrix} & $_firstNumber \\\\ +& $_secondNumber  \\\\ \\end{matrix}} \$\$',
                    style: TeXViewStyle(
                        height: 200, fontStyle: TeXViewFontStyle(fontSize: 45)))
                // '\$\$\\begin{matrix} & $_secondNumber \\\\ +& $_firstNumber  \\\\ \\end{matrix} \\\\ hline \$\$')
              ]),
              style: const TeXViewStyle(
                elevation: 10,
                // borderRadius: TeXViewBorderRadius.all(25),
                // border: TeXViewBorder.all(TeXViewBorderDecoration(
                //     borderColor: Colors.blue,
                //     borderStyle: TeXViewBorderStyle.Solid,
                //     borderWidth: 5)),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
                width: 100, child: MyCustomForm(_firstNumber, _secondNumber))
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
