
import 'package:bloc_statemanagement/cubit/task_cubit.dart';
import 'package:bloc_statemanagement/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
// Bloc.observer = MyblocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(create: (context) => TaskCubit())
        
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Home(),
      ),
    );
  }
}
