import 'package:flutter/material.dart';
import 'package:to_do_app_bloc/to_do_model.dart';

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
          controller: searchController,
          decoration: const InputDecoration(label: Text("Add new task")),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: addTextController,
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
      onPressed: () {},
      child: Text(filterType == Filter.active
          ? "ACTIVE"
          : filterType == Filter.all
              ? "ALL"
              : "COMPLETED"));
}
