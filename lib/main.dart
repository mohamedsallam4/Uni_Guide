// lib/main.dart

import 'package:bloc_statemanagement/data/repository/university_repository.dart';
import 'package:bloc_statemanagement/data/web_servies/web_servies.dart';
import 'package:bloc_statemanagement/logic/cubit/univ_cubit.dart';
import 'package:bloc_statemanagement/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final webServices = UniversityWebServices();
    final repository = UniversityRepository(webServices);

    return RepositoryProvider<UniversityRepository>(
      create: (_) => repository,
      child: BlocProvider<UnivCubit>(
        create: (context) => UnivCubit(context.read<UniversityRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Universities Demo',
          theme: ThemeData(primarySwatch: Colors.brown),
          home: const UnivSearchPage(),
        ),
      ),
    );
  }
}
