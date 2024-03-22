import 'package:flutter/material.dart';

class ToDoItemWidget extends StatefulWidget {
  const ToDoItemWidget({super.key});

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
                    onTap: () {},
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
                content: TextField(
                  controller: editController,
                  onSubmitted: (value) {},
                ),
              );
            });
      },
      child: ListTile(
        title: Text("abc"),
        trailing: Checkbox(
          onChanged: (value) {},
          value: true,
        ),
      ),
    );
  }
}
