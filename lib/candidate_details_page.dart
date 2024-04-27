import 'package:flutter/material.dart';
import 'candidate.dart';

class CandidateDetailsPage extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailsPage({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(candidate.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(candidate.photoUrl ?? ''),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Nom du candidat : ${candidate.name}'),
            SizedBox(height: 8.0),
            Text('Parti : ${candidate.party}'),
            SizedBox(height: 8.0),
            Text('Description : ${candidate.description}'),
          ],
        ),
      ),
    );
  }
}
