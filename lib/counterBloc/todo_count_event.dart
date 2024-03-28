import 'package:equatable/equatable.dart';

class TodoCountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CalculateTodoCountEvent extends TodoCountEvent {
  final int count;
  CalculateTodoCountEvent({required this.count});
  @override
  List<Object?> get props => [count];
}
