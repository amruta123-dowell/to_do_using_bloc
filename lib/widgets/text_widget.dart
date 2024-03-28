import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_bloc/filterbloc/filter_bloc.dart';
import 'package:to_do_app_bloc/searchBloc/search_bloc.dart';
import 'package:to_do_app_bloc/to_do_model.dart';
import 'package:to_do_app_bloc/todoListBloc/to_do_list_bloc.dart';

class TextWidget extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController addTextController = TextEditingController();
  TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onSubmitted: (value) {
            context.read<ToDoListBloc>().add(AddTodoEvent(description: value));
          },
          controller: addTextController,
          decoration: const InputDecoration(label: Text("Add new task")),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          onChanged: (value) {
            context.read<SearchBloc>().add(SearchTextEvent(searchText: value));
          },
          // onFieldSubmitted: (value) {
          //   context.read<SearchBloc>().add(SearchTextEvent(searchText: value));
          // },
          controller: searchController,
          decoration:
              const InputDecoration(label: Text("Search To do"), filled: true),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed)
          ],
        )
      ],
    );
  }
}

Widget filterButton(BuildContext context, Filter filterType) {
  return TextButton(
    onPressed: () {
      context
          .read<FilterBloc>()
          .add(ChangeFilterEvent(newSelectedFilter: filterType));
    },
    child: Text(
        filterType == Filter.active
            ? "ACTIVE"
            : filterType == Filter.all
                ? "ALL"
                : "COMPLETED",
        style: TextStyle(
            color: context.watch<FilterBloc>().state.filterType == filterType
                ? Colors.purple
                : Colors.grey)),
  );
}
