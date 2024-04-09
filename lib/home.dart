import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final _counterCubit = CounterCubit(); // created an instance of CounterCubit.
  // if I create another instance of CounterCubit in another class, it will not be the same instance as this one.
  // It means that the state of the CounterCubit in this class will not be the same as the state of the CounterCubit in the other class.
  // that's why I used BlocProvider in the main.dart file to create an instance of CounterCubit for the entire app.

  


  @override
  Widget build(BuildContext context) {
    final _counterCubit = BlocProvider.of<CounterCubit>(context); // this is how I can access the instance of CounterCubit that was created in the main.dart file.
    // now you can access the state of the CounterCubit from anywhere in the app.
    //using BlocProvider.of<CounterCubit>(context) is the same as using Provider.of<CounterCubit>(context) in the Provider package.


    // return BlocBuilder<CounterCubit, int>(
    //   bloc: _counterCubit, // as soon as the value of the CounterCubit changes, the builder will be called.
    //   builder: (context, counter) { // here counter is the state of the CounterCubit(data from the CounterCubit).
    // instead of rebuilding the entire widget tree, only the widget that is wrapped in the BlocBuilder will be rebuilt.
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
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
                BlocBuilder<CounterBloc, int>(
                  // bloc: _counterCubit,
                  // if you have a BlocProvider in the main.dart file, you don't need to pass the instance of the CounterCubit to the BlocBuilder.
                  // because BlocBuild itself will get the instance of the CounterCubit from the context.
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
                onPressed: () => _counterBloc.add(CounterIncremented()),
                // add is a method that is used to add an event to the Bloc.
                //_counterCubit.increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => _counterBloc.add(CounterDecremented()),
                //() => _counterCubit.decrement(),
                tooltip: 'decrement',
                child: const Icon(Icons.minimize),
              ),
            ],
          ),
        );
      }
    
  
}