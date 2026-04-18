import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/directory_cubit.dart';
import '../../cubit/directory_state.dart';
import 'package:bloc_statemanagement/core/widgets/app_loading_widget.dart';
import 'package:bloc_statemanagement/core/widgets/app_error_widget.dart';

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DirectoryCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('University Directory')),
        body: BlocBuilder<DirectoryCubit, DirectoryState>(
          builder: (context, state) {
            if (state is DirectoryLoading) {
              return const AppLoadingWidget();
            } else if (state is DirectoryLoaded) {
              return ListView.builder(
                itemCount: state.universities.length,
                itemBuilder: (context, index) {
                  final university = state.universities[index];
                  return ListTile(
                    title: Text(university.name),
                    subtitle: Text(university.location),
                    onTap: () {
                      // Navigate to detail
                    },
                  );
                },
              );
            } else if (state is DirectoryError) {
              return AppErrorWidget(
                message: state.message,
                onRetry: () {
                  context.read<DirectoryCubit>().loadUniversities();
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}