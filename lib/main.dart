import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_bloc/counterBloc/todo_count_bloc.dart';
import 'package:to_do_app_bloc/filterbloc/filter_bloc.dart';
import 'package:to_do_app_bloc/filtered_todo_list/filtered_todo_bloc.dart';
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
        BlocProvider(create: (context) => ToDoListBloc()),
        BlocProvider(
            create: (context) => TodoCountBloc(
                initialCount:
                    context.read<ToDoListBloc>().state.todoList.length,
                todoListBloc: context.read<ToDoListBloc>())),
        BlocProvider(create: (context) => SearchBloc()),
        BlocProvider(create: (context) => FilterBloc()),
        BlocProvider(
            create: (context) => FilteredToDoBloc(
                // initialTodo: context.read<ToDoListBloc>().state.todoList,
                // toDoListBloc: context.read<ToDoListBloc>(),
                // filterTodoBloc: context.read<FilterBloc>(),
                // searchBloc: context.read<SearchBloc>(),
                initialTodos: context.read<ToDoListBloc>().state.todoList,
                todoFilterBloc: context.read<FilterBloc>(),
                todoSearchBloc: context.read<SearchBloc>(),
                todoListBloc: context.read<ToDoListBloc>())),
      ],
      child: MaterialApp(
        home: ToDoScreen(),
      ),
    );
  }
}
