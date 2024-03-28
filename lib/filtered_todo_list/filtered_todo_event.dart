part of 'filtered_todo_bloc.dart';

class FilteredTodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CalculateFilteredListEvent extends FilteredTodoEvent {
  final List<ToDoModel> todoList;
 CalculateFilteredListEvent({required this.todoList});
  @override
  List<Object> get props => [todoList];
}
