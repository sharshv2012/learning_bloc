
part of 'counter_bloc.dart';
//part of means that this file is a part of the file counter_bloc.dart.

sealed class CounterEvent{

}

final class CounterIncremented extends CounterEvent{

}
final class CounterDecremented extends CounterEvent{

}