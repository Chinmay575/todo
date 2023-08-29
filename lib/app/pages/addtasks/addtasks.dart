import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
      resizeToAvoidBottomInset: false,
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
                    SizedBox(
                      width: 325,
                      child: TextField(
                        onChanged: (value) {
                          context
                              .read<AddtasksBloc>()
                              .add(GetTaskNameEvent(name: value));
                        },
                        decoration: InputDecoration(
                          hintText: "Enter task name....",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 325,
                      child: TextField(
                        onChanged: (value) {
                          context
                              .read<AddtasksBloc>()
                              .add(GetDescriptionEvent(desc: value));
                        },
                        decoration: InputDecoration(
                          hintText: "Enter description....",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 325,
                      height: 60,
                      decoration: BoxDecoration(
                        color: state.color ?? Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  title: const Text('Pick a color!'),
                                  content: SingleChildScrollView(
                                    child: BlockPicker(
                                      pickerColor: Colors.black,
                                      onColorChanged: (color) {
                                        context
                                            .read<AddtasksBloc>()
                                            .add(GetColorEvent(color: color));
                                      },
                                      availableColors: const [
                                        Color(0xFF1E1E1E), // Almost Black
                                        Color(0xFF2C3E50), // Dark Blue
                                        Color(0xFF34495E), // Dark Slate Grey
                                        Color(0xFF2E4053), // Dark Gunmetal
                                        Color(0xFF4A235A), // Dark Purple
                                        Color(0xFF7D6608), // Dark Yellow
                                        Color(0xFF8E44AD), // Dark Orchid
                                        Color(0xFFC0392B), // Dark Red
                                        Color(0xFFD35400), // Dark Orange
                                        Color(0xFFA93226), // Dark Flat Red
                                        Color(0xFF27AE60), // Dark Green
                                        Color(0xFF2980B9), // Dark Blue
                                        Color(0xFF6A1B9A), // Dark Violet
                                        Color(0xFFF39C12), // Dark Yellow
                                        Color(0xFFE74C3C), // D
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Center(
                                      child: MaterialButton(
                                        minWidth: 300,
                                        height: 50,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        color: Colors.green,
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); //dismiss the color picker
                                        },
                                        child: const Text(
                                          'DONE',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Center(
                          child: Text(
                            "Tap to change color",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context).add(
                          AddTaskEvent(
                            task: state.name,
                            color: state.color,
                            desc: state.desc,
                          ),
                        );
                        if (!(Platform.isWindows ||
                            Platform.isLinux ||
                            Platform.isMacOS)) {
                          showToast("Task added Successfully");
                        }
                        BlocProvider.of<AddtasksBloc>(context)
                            .add(NavigateToHomePageEvent(context));
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
