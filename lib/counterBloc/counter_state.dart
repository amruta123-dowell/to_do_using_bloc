// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int count;
  const CounterState({required this.count});

  @override
  List<Object> get props => [];

  CounterState copyWith({required int count}) {
    return CounterState(count: count);
  }

factory CounterState.initial(){
  return const  CounterState(count: 0);
}

  @override
  bool get stringify => true;
}
