// lib/presentation/screens/univ/univ_details_page.dart

import 'package:bloc_statemanagement/data/model/university_model.dart';
import 'package:flutter/material.dart';

class UnivDetailsPage extends StatelessWidget {
  final University university;
  const UnivDetailsPage({Key? key, required this.university}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final webPages = university.webPages;
    return Scaffold(
      appBar: AppBar(
        title: Text(university.name),
        backgroundColor: Colors.brown[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(university.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Country: ${university.country}'),
          const SizedBox(height: 12),
          Text('Domain: ${university.domain ?? '—'}'),
          const SizedBox(height: 12),
          const Text('Web pages:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          if (webPages.isEmpty) const Text('—'),
          for (var p in webPages) Padding(padding: const EdgeInsets.symmetric(vertical: 4.0), child: Text(p)),
        ]),
      ),
    );
  }
}
