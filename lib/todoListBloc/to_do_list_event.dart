part of 'to_do_list_bloc.dart';

class ToDoListEvent extends Equatable {
  const ToDoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends ToDoListEvent {
  final String description;

  const AddTodoEvent({required this.description});

  @override
  List<Object> get props => [description];
}

class EditTodoEvent extends ToDoListEvent {
  final String description;
  final String id;
  const EditTodoEvent({required this.description, required this.id});

  @override
  List<Object> get props => [description, id];
}

class RemoveTodoEvent extends ToDoListEvent {
  final ToDoModel todo;
  const RemoveTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class ToggleTodoEvent extends ToDoListEvent {
  final String id;
  const ToggleTodoEvent({required this.id});
}
