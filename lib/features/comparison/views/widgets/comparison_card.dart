import 'package:flutter/material.dart';

class ComparisonCard extends StatelessWidget {
  final String title;
  final String value;

  const ComparisonCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(value),
          ],
        ),
      ),
    );
  }
}