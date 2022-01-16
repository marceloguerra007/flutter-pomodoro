import 'package:mobx/mobx.dart';

part 'counter.store.g.dart'; //Executar no terminal o comando a seguir para gerar o arquivo: flutter pub run build_runner watch

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int counter = 0;

  @action
  void increment(){
    counter++;
  }
}