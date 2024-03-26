import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weight_provider.g.dart';


@Riverpod(keepAlive: true)
class Weight extends _$Weight {
  @override
 int build() => 5;

 // incrementar la cantidad
  void increaseByOne() {
    state++;
  }

  void increaseByTwo() {
    state = state + 2;
  }

  void decreaseByOne() {
    state--;
  }

}
