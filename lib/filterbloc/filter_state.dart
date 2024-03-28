
part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final Filter filterType;
  const FilterState({
    required this.filterType,
  });

  @override
  List<Object> get props => [filterType];

  FilterState copyWith({
    required Filter filter,
  }) {
    return FilterState(filterType: filter);
  }

  factory FilterState.initial() {
    return const FilterState(filterType: Filter.all);
  }
}
