import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app/widgets/random_color.dart';
import 'package:todo/app/widgets/toasts.dart';

import '../../models/task.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text("To-Do Companion"),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 50),
            child: (state.tasks.isEmpty)
                ? const Center(
                    child: Text("Tap on + icon to add tasks"),
                  )
                : ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      Task _task = state.tasks[index];
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: randomColor(),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 50,
                        width: double.maxFinite,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<HomeBloc>()
                                    .add(RemoveTaskEvent(index: index));
                              },
                              icon: (_task.isCompleted!)
                                  ? Icon(Icons.check_box_outlined)
                                  : Icon(Icons.check_box_outline_blank),
                            ),
                            Center(
                              child: Text(
                                _task.name,
                                style: TextStyle(
                                  decoration: (_task.isCompleted!)
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              print("Clicked");

              context.read<HomeBloc>().add(AddTaskEvent(task: "Wash Clothes"));
              showToast("Added new Task");
              print(state.tasks);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
