import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_bloc/counterBloc/counter_bloc.dart';
import 'package:to_do_app_bloc/widgets/list_widget.dart';
import 'package:to_do_app_bloc/widgets/text_widget.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: Text("TO DO")),
                Text(
                    "Number of Todos ${context.watch<CounterBloc>().state.count}"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(),
            const SizedBox(
              height: 15,
            ),
            ListWidget()
          ],
        )),
      ),
    );
  }
}
