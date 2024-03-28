import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_bloc/to_do_model.dart';
import 'package:to_do_app_bloc/todoListBloc/to_do_list_bloc.dart';

class ToDoItemWidget extends StatefulWidget {
  final ToDoModel item;
  const ToDoItemWidget({super.key, required this.item});

  @override
  State<ToDoItemWidget> createState() => _ToDoItemWidgetState();
}

class _ToDoItemWidgetState extends State<ToDoItemWidget> {
  final TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  InkWell(
                    onTap: () {
                      context.read<ToDoListBloc>().add(EditTodoEvent(
                          description: editController.text,
                          id: widget.item.idNo!));
                      Navigator.pop(context);
                    },
                    child: const SizedBox(
                      height: 30,
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const SizedBox(
                      height: 30,
                      child: Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
                content: TextField(
                  controller: editController,
                  onSubmitted: (value) {},
                  decoration: const InputDecoration(
                      label: Text("edit todo description")),
                ),
              );
            });
      },
      child: ListTile(
        title: Text(widget.item.description),
        trailing: Checkbox(
          onChanged: (value) {
            context
                .read<ToDoListBloc>()
                .add(ToggleTodoEvent(id: widget.item.idNo ?? ''));
          },
          value: widget.item.isCompleted,
        ),
      ),
    );
  }
}
