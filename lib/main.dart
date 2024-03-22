import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_bloc/counterBloc/counter_bloc.dart';
import 'package:to_do_app_bloc/searchBloc/search_bloc.dart';
import 'package:to_do_app_bloc/to_do_screen.dart';
import 'package:to_do_app_bloc/todoListBloc/to_do_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SearchBloc()),
        BlocProvider(create: (context) => ToDoListBloc()), 
      ],
      child: MaterialApp(
        home: ToDoScreen(),
      ),
    );
  }
}
