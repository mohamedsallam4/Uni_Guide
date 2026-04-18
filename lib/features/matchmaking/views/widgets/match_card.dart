import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final String universityName;
  final String matchPercentage;

  const MatchCard({
    super.key,
    required this.universityName,
    required this.matchPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(universityName),
        subtitle: Text('Match: $matchPercentage%'),
      ),
    );
  }
}