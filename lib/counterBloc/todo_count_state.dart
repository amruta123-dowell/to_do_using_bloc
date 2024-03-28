// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_count_bloc.dart';

class TodoCountState extends Equatable {
  final int count;
  const TodoCountState({required this.count});

  @override
  List<Object> get props => [count];

  TodoCountState copyWith({required int count}) {
    return TodoCountState(count: count);
  }

  factory TodoCountState.initial() {
    return const TodoCountState(count: 0);
  }

  @override
  bool get stringify => true;
}
