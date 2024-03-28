import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app_bloc/to_do_model.dart';

part 'to_do_list_event.dart';
part 'to_do_list_state.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc() : super(ToDoListState.initial()) {
    on<ToDoListEvent>((event, emit) {});
    on<AddTodoEvent>(addTodoList);
    on<EditTodoEvent>(editTodoList);
    on<ToggleTodoEvent>(toggleTodo);
  }

  FutureOr<void> addTodoList(AddTodoEvent event, Emitter<ToDoListState> emit) {
    ToDoModel newTodo = ToDoModel(description: event.description);
    List<ToDoModel> addedList = [...state.todoList, newTodo];
    emit(state.copyWith(todoList: addedList));
  }

  FutureOr<void> editTodoList(
      EditTodoEvent event, Emitter<ToDoListState> emit) {
    List<ToDoModel> editTodoList = state.todoList.map((element) {
      if (event.id == element.idNo) {
        return ToDoModel(
            description: event.description,
            idNo: event.id,
            isCompleted: element.isCompleted);
      }
      return element;
    }).toList();
    emit(state.copyWith(todoList: editTodoList));
  }

  FutureOr<void> toggleTodo(
      ToggleTodoEvent event, Emitter<ToDoListState> emit) {
    List<ToDoModel> todoList = state.todoList.map((element) {
      if (element.idNo == event.id) {
        return ToDoModel(
            description: element.description,
            idNo: event.id,
            isCompleted: !element.isCompleted);
      }
      return element;
    }).toList();
    emit(state.copyWith(todoList: todoList));
  }
}
