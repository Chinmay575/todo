import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app/pages/addtasks/addtasks.dart';
import 'package:todo/app/pages/addtasks/bloc/addtasks_bloc.dart';

import 'app/pages/home/bloc/home_bloc.dart';
import 'app/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AddtasksBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'To-Do App',
        theme: ThemeData(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          useMaterial3: true,
        ),
        // home: const HomePage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/addTasks': (context) => const AddTaskPage(),
        },
      ),
    );
  }
}
