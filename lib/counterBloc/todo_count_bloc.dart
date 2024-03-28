import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app_bloc/counterBloc/todo_count_event.dart';
import 'package:to_do_app_bloc/todoListBloc/to_do_list_bloc.dart';

part 'todo_count_state.dart';

class TodoCountBloc extends Bloc<TodoCountEvent, TodoCountState> {
  late final StreamSubscription todoListSubscription;
  final int initialCount;
  final ToDoListBloc todoListBloc;
  TodoCountBloc({required this.initialCount, required this.todoListBloc})
      : super(TodoCountState(count: initialCount)) {
    todoListSubscription =
        todoListBloc.stream.listen((ToDoListState todoListState) {
      int todoCount = todoListState.todoList
          .where((element) => element.isCompleted == false)
          .toList()
          .length;
      add(CalculateTodoCountEvent(count: todoCount));
    });
    on<CalculateTodoCountEvent>((event, emit) {
      emit(state.copyWith(count: event.count));
    });
  }
  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
