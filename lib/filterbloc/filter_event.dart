part of 'filter_bloc.dart';

class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends FilterEvent {
  final Filter newSelectedFilter;
  const ChangeFilterEvent({required this.newSelectedFilter});

  @override
  List<Object> get props => [newSelectedFilter];
}
