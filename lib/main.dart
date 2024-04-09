import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';
import 'package:learning_bloc/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()), // creates an instance of CounterCubit for the entire app.
      // now I don't have to create an instance of CounterCubit in the MyHomePage class or any other class.
      // this is how you do App wide state management in Flutter using the Bloc package.)

        BlocProvider(create: (context) => CounterBloc()),
      ], // instead of Nesting BlocProviders, I can use MultiBlocProvider to provide multiple instances of Blocs.
      
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}




