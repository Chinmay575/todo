import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app/pages/addtasks/bloc/addtasks_bloc.dart';
import 'package:todo/app/pages/home/bloc/home_bloc.dart';
import 'package:todo/app/widgets/toasts.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<AddtasksBloc, AddtasksState>(
          builder: (context, state) {
            return Center(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        "Add a new Task ......",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 325,
                      child: TextField(
                        onChanged: (value) {
                          context
                              .read<AddtasksBloc>()
                              .add(GetTaskNameEvent(task: value));
                        },
                        decoration: InputDecoration(
                            hintText: "Enter task name....",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(AddTaskEvent(task: state.task));
                        showToast("Task added Successfully");
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 325,
                        height: 60,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Done",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
