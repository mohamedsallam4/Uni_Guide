import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import 'package:bloc_statemanagement/core/widgets/app_loading_widget.dart';
import 'package:bloc_statemanagement/core/widgets/app_error_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const AppLoadingWidget();
            } else if (state is HomeLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.data.greeting,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    const Text('Recommended Universities:'),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.data.recommendations.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.data.recommendations[index]),
                            onTap: () {
                              // Navigate to university detail
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is HomeError) {
              return AppErrorWidget(
                message: state.message,
                onRetry: () {
                  context.read<HomeCubit>().loadHomeData();
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