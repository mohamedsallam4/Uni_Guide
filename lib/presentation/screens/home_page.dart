// lib/presentation/screens/univ/univ_search_page.dart

import 'package:bloc_statemanagement/data/model/university_model.dart';
import 'package:bloc_statemanagement/logic/cubit/univ_cubit.dart';
import 'package:bloc_statemanagement/logic/cubit/univ_state.dart';
import 'package:bloc_statemanagement/presentation/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UnivSearchPage extends StatefulWidget {
  const UnivSearchPage({Key? key}) : super(key: key);

  @override
  State<UnivSearchPage> createState() => _UnivSearchPageState();
}

class _UnivSearchPageState extends State<UnivSearchPage> {
  final TextEditingController _controller = TextEditingController();

  void _search() {
    final text = _controller.text.trim();
    context.read<UnivCubit>().loadByCountry(text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildList(List<University> list) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final u = list[index];
        return ListTile(
          title: Text(u.name),
          subtitle: Text(u.country),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UnivDetailsPage(university: u)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بحث عن جامعات'),
        backgroundColor: Colors.brown[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'اسم الدولة (مثال: Egypt)',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _search(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _search,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[700]),
                    child: const Text('بحث'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: BlocBuilder<UnivCubit, UnivState>(
                builder: (context, state) {
                  if (state.status == UnivStatus.initial) {
                    return const Center(child: Text('اكتب اسم دولة واضغط بحث'));
                  } else if (state.status == UnivStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == UnivStatus.failure) {
                    return Center(child: Text(state.errorMessage ?? 'حدث خطأ'));
                  } else {
                    final List<University> list = state.universities;
                    if (list.isEmpty) {
                      return const Center(child: Text('لا توجد جامعات لهذه الدولة'));
                    }
                    return _buildList(list);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
