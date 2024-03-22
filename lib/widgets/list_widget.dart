import 'package:flutter/material.dart';
import 'package:to_do_app_bloc/widgets/to_do_item_widget.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            child: ToDoItemWidget()
          );
        });
  }
}
