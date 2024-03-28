// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:to_do_app_bloc/filterbloc/filter_bloc.dart';
// import 'package:to_do_app_bloc/searchBloc/search_bloc.dart';
// import 'package:to_do_app_bloc/todoListBloc/to_do_list_bloc.dart';

// import '../to_do_model.dart';

// part 'filtered_todo_event.dart';
// part 'filtered_todo_state.dart';

// class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
//   late StreamSubscription filterSubscription;
//   late StreamSubscription searchSubscription;
//   late StreamSubscription todoListSubscription;
//   final List<ToDoModel> initialTodo;
//   final ToDoListBloc toDoListBloc;
//   final SearchBloc searchBloc;
//   final FilterBloc filterTodoBloc;
//   FilteredTodoBloc({
//     required this.initialTodo,
//     required this.toDoListBloc,
//     required this.filterTodoBloc,
//     required this.searchBloc,
//   }) : super(FilteredTodoState(todoList: initialTodo)) {
//     todoListSubscription = toDoListBloc.stream.listen((event) {
//       setFilteredList();
//     });
//     filterSubscription = filterTodoBloc.stream.listen((event) {
//       setFilteredList();
//     });
//     searchSubscription = searchBloc.stream.listen((event) {
//       setFilteredList();
//     });
//     on<CalculateFilteredListEvent>((event, emit) {
//       emit(state.copyWith(todoList: event.todoList));
//     });
//   }
//   void setFilteredList() {
//     List<ToDoModel> _todoList;
//     switch (filterTodoBloc.state.filterType) {
//       case Filter.active:
//         _todoList = toDoListBloc.state.todoList
//             .where((element) => !(element.isCompleted))
//             .toList();
//         break;
//       case Filter.completed:
//         _todoList = toDoListBloc.state.todoList
//             .where((element) => element.isCompleted)
//             .toList();
//       case Filter.all:
//         _todoList = toDoListBloc.state.todoList;
//       default:
//         _todoList = toDoListBloc.state.todoList;
//     }
//     if (searchBloc.state.searchText.isNotEmpty) {
//       _todoList = toDoListBloc.state.todoList
//           .where((element) =>
//               element.description.contains(searchBloc.state.searchText))
//           .toList();
//     }
//     add(CalculateFilteredListEvent(todoList: _todoList));
//   }

//   @override
//   Future<void> close() {
//     todoListSubscription.cancel();
//     filterSubscription.cancel();
//     searchSubscription.cancel();
//     return super.close();
//   }
// }

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app_bloc/filterbloc/filter_bloc.dart';
import 'package:to_do_app_bloc/searchBloc/search_bloc.dart';
import 'package:to_do_app_bloc/to_do_model.dart';
import 'package:to_do_app_bloc/todoListBloc/to_do_list_bloc.dart';

part 'filtered_todo_state.dart';
part 'package:to_do_app_bloc/filtered_todo_list/filtered_todo_event.dart';

class FilteredToDoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  late StreamSubscription todoFilterSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoListSubscription;

  final List<ToDoModel> initialTodos;

  final FilterBloc todoFilterBloc;
  final SearchBloc todoSearchBloc;
  final ToDoListBloc todoListBloc;

  FilteredToDoBloc({
    required this.initialTodos,
    required this.todoFilterBloc,
    required this.todoSearchBloc,
    required this.todoListBloc,
  }) : super(FilteredTodoState(
          todoList: initialTodos,
        )) {
    todoFilterSubscription =
        todoFilterBloc.stream.listen((FilterState todoFilterState) {
      setFilteredTodos();
    });

    todoSearchSubscription =
        todoSearchBloc.stream.listen((SearchState todoSearchState) {
      setFilteredTodos();
    });

    todoListSubscription =
        todoListBloc.stream.listen((ToDoListState todoListState) {
      setFilteredTodos();
    });

    on<CalculateFilteredListEvent>((event, emit) {
      emit(state.copyWith(todoList: event.todoList));
    });
  }

  void setFilteredTodos() {
    List<ToDoModel> _filteredTodos;

    switch (todoFilterBloc.state.filterType) {
      case Filter.active:
        _filteredTodos = todoListBloc.state.todoList
            .where((ToDoModel todo) => !todo.isCompleted)
            .toList();
        break;
      case Filter.completed:
        _filteredTodos = todoListBloc.state.todoList
            .where((ToDoModel todo) => todo.isCompleted)
            .toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todoListBloc.state.todoList;
        break;
    }

    if (todoSearchBloc.state.searchText.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((ToDoModel todo) => todo.description
              .toLowerCase()
              .contains(todoSearchBloc.state.searchText.toLowerCase()))
          .toList();
    }

    add(CalculateFilteredListEvent(todoList: _filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
