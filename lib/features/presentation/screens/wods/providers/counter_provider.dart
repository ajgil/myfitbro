import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 5;

// incrementar la cantidad
  void increaseByOne() {
    state++;
  }
}

// DarkMode -> boolean default: false

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void toggleDarkMode() {
    state = !state;
  }
}

// String  Wod name
// Default: 'Melisa flores'
// changeName (String name)
// usernameProvider.notifier).changeName(RandomGenerator.getRandomGenerator
@riverpod
class WodName extends _$WodName {
  @override
  String build() => 'Melisa flores';

  void changeWodName(String wodName) {
    state = wodName;
  }
}
