import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterCubit = CounterCubit();
  


  @override
  Widget build(BuildContext context) {
    
    // return BlocBuilder<CounterCubit, int>(
    //   bloc: _counterCubit, // as soon as the value of the CounterCubit changes, the builder will be called.
    //   builder: (context, counter) { // here counter is the state of the CounterCubit(data from the CounterCubit).
    // instead of rebuilding the entire widget tree, only the widget that is wrapped in the BlocBuilder will be rebuilt.
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterCubit, int>(
                  bloc: _counterCubit,
                  builder: (context, counter) =>
                Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end ,
            children: [
              
              FloatingActionButton(
                onPressed: () => _counterCubit.increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => _counterCubit.decrement(),
                tooltip: 'decrement',
                child: const Icon(Icons.minimize),
              ),
            ],
          ),
        );
      }
    
  
}