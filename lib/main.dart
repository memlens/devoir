import 'package:flutter/material.dart';
import 'candidate_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste des candidats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CandidateListPage(),
    );
  }
}
