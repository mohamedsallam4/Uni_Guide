import 'package:bloc_statemanagement/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          final controllerCubit=  context.read<TaskCubit>();
          return Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(hintText: "Enter task"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (controller.text.isEmpty) return;
                 controllerCubit.addTask(controller.text);
                  controller.clear();
                },
                label: Text("ADD"),
                icon: Icon(Icons.add),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.tasklist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(state.tasklist[index].title),
                      leading: Checkbox(
                        value: state.tasklist[index].iscompleted,
                        onChanged: (value) => controllerCubit
                            .toggleTask(state.tasklist[index].id),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          controllerCubit.removeTask(
                            state.tasklist[index].id,
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
