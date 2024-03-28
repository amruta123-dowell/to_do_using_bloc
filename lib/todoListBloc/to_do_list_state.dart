part of 'to_do_list_bloc.dart';

class ToDoListState extends Equatable {
  final List<ToDoModel> todoList;
  const ToDoListState({required this.todoList});

  @override
  List<Object> get props => [todoList];

  @override
  bool get stringify => true;

  ToDoListState copyWith({required List<ToDoModel> todoList}) {
    return ToDoListState(todoList: todoList);
  }

  factory ToDoListState.initial() {
    return ToDoListState(todoList: [
      ToDoModel(description: "reading book", idNo: "1", isCompleted: false),
      ToDoModel(description: "Watching movies", idNo: "2", isCompleted: false),
      ToDoModel(description: "Cleaning house", idNo: "3", isCompleted: false),
    ]);
  }
}
