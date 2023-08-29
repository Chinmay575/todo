import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app/global/init.dart';
import 'package:todo/app/pages/addtasks/addtasks.dart';
import 'package:todo/app/pages/addtasks/bloc/addtasks_bloc.dart';

import 'app/pages/home/bloc/home_bloc.dart';
import 'app/pages/home/home.dart';

void main() {
  Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(InitialEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AddtasksBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'To-Do App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/addTasks': (context) => const AddTaskPage(),
        },
      ),
    );
  }
}
