part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTextEvent extends SearchEvent {
  final String searchText;
  const SearchTextEvent({required this.searchText});
  @override
  List<Object> get props => [searchText];
}
