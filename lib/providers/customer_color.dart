import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_statefnotifier_practice/providers/counter.dart';
import 'package:state_notifier/state_notifier.dart';

enum Level { bronze, silver, gold }

class CustomerColor extends StateNotifier<Level> with LocatorMixin {
  CustomerColor()
      : super(Level
            .bronze); //this._state => _state = T 타입이므로 여기서 T는 Level이다. 따라서 _state값에 초기 값을 설정하는것 즉 Level.bronze를 넣게 되면 T의 값이 결정된다.

  //CounterState의 count의 수가 화면에 뿌려지고 있는데 수가 변할때 발생하는거자나 그니깐
  @override
  void update(Locator watch) {
    // T Function<T>  T타입을 반환하는 Function이라는 뜻임
    int count = watch<CounterState>().count;
    if (count >= 100) {
      state = Level.gold;
    } else if (count < 100 && count >= 50) {
      state = Level.silver;
    } else {
      state = Level.bronze;
    }
    super.update(watch);
  }
}
