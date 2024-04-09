import 'package:flutter_bloc/flutter_bloc.dart';

// sealed class CounterEvent{

// }

// final class CounterIncremented extends CounterEvent{

// }
// final class CounterDecremented extends CounterEvent{

// }

//

part 'counter_event.dart';
//part means that counter_event.dart file is a part of this file.
// the advantage is that we don't have to import the file counter_event.dart anywhere separately.

// if you have more than one event classes, you can use the sealed package to create sealed classes.
// this way you can pass the classes as a single object to the Bloc.

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0){
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecremented>((event, emit) {
      if(state == 0){
        return;
      }
      emit(state - 1);
    });
  }

  
}