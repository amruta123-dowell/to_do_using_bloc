// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String searchText;

  const SearchState({required this.searchText});

  @override
  List<Object> get props => [searchText];

  SearchState copyWith({required String searchText}) {
    return SearchState(searchText: searchText);
  }

  @override
  bool get stringify => true;

  factory SearchState.initial() {
    return const SearchState(searchText: '');
  }
}
