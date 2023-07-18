// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class BgColorState {
  final Color color;
  BgColorState({
    required this.color,
  });

  @override
  String toString() => 'BgColorState(color: $color)';

  BgColorState copyWith({
    Color? color,
  }) {
    return BgColorState(
      color: color ?? this.color,
    );
  }
}

class BgColor extends StateNotifier<BgColorState> with LocatorMixin{
  BgColor() : super(BgColorState(color: Colors.blue));  //초기값으로 설정하는거지

  //state를 만들 필요 없이 StateNotifier의 <T> T 타입의 state가 생긴다고 변수로 바로 사용할 수 있는듯?
  void changeColor(){
    if (state.color == Colors.blue){
      state = state.copyWith(color: Colors.black);
    } else if (state.color == Colors.black) {
      state = state.copyWith(color: Colors.red);
    } else {
      state = state.copyWith(color: Colors.blue);
    }
    //notifierlistner이거를 할 필요가 없는거지 
  }

}
