import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_statefnotifier_practice/providers/bg_color.dart';
import 'package:flutter_statefnotifier_practice/providers/counter.dart';
import 'package:flutter_statefnotifier_practice/providers/customer_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<BgColor, BgColorState>(
          create: (context) => BgColor(),
        ),
        StateNotifierProvider<Counter, CounterState>(
          create: (context) => Counter(),
        ),
        StateNotifierProvider<CustomerColor, Level>(
          create: (context) => CustomerColor(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final colorState = context.watch<BgColorState>();
    final counterState = context.watch<CounterState>();
    final customerLevel = context.watch<Level>();

    return Scaffold(
      backgroundColor: customerLevel == Level.bronze
          ? Colors.white
          : customerLevel == Level.silver
              ? Colors.grey
              : Colors.purple,
      appBar: AppBar(
        title: Text('AppBar'),
        backgroundColor: colorState.color,
      ),
      body: Center(
          child: Text(
        '${counterState.count}',
        style: TextStyle(fontSize: 48.0),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<Counter>().increment();
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.black,
          ),
          SizedBox(
            width: 20.0,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<BgColor>().changeColor();
            },
            child: Icon(Icons.color_lens_outlined),
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
