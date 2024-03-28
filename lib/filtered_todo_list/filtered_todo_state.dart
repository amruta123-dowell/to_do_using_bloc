// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtered_todo_bloc.dart';

class FilteredTodoState extends Equatable {
  final List<ToDoModel> todoList;
  const FilteredTodoState({required this.todoList});

  @override
  List<Object> get props => [todoList];

  FilteredTodoState copyWith({
    required List<ToDoModel> todoList,
  }) {
    return FilteredTodoState(todoList: todoList);
  }
}
