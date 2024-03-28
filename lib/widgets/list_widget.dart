import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_bloc/filtered_todo_list/filtered_todo_bloc.dart';
import 'package:to_do_app_bloc/to_do_model.dart';
import 'package:to_do_app_bloc/todoListBloc/to_do_list_bloc.dart';
import 'package:to_do_app_bloc/widgets/to_do_item_widget.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<ToDoModel> todoList = context.watch<FilteredToDoBloc>().state.todoList;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
              child: ToDoItemWidget(
            item: todoList[index],
          ));
        });
  }
}
