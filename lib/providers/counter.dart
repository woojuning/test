// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_statefnotifier_practice/providers/bg_color.dart';

class CounterState{
  final int count;
  CounterState({
    required this.count,
  });
  

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }
}

class Counter extends StateNotifier<CounterState> with LocatorMixin{
  Counter() : super(CounterState(count: 0));

  void increment(){
    final color = read<BgColorState>().color;
    if (color == Colors.blue) {
      state = state.copyWith(count: state.count + 1);
    } else if (color == Colors.black) {
      state = state.copyWith(count: state.count + 10);
    } else {
      state = state.copyWith(count: state.count - 10);
    }
  }

}
