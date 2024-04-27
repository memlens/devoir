import 'package:flutter/material.dart';
import 'candidate_form_page.dart';
import 'candidate_details_page.dart';
import 'candidate.dart';

class CandidateListPage extends StatefulWidget {
  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  final List<Candidate> candidates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des candidats'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal, // Défilement horizontal
        itemCount: candidates.length,
        itemBuilder: (BuildContext context, int index) {
          final candidate = candidates[index];
          return GestureDetector(
            onTap: () => _navigateToDetailsPage(candidate),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: SizedBox(
                width: 200, // Largeur fixe pour chaque élément
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image.network(
                        candidate.photoUrl ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              candidate.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              candidate.party,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CandidateFormPage()),
          ).then((value) {
            if (value != null) {
              setState(() {
                candidates.add(value);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToDetailsPage(Candidate candidate) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CandidateDetailsPage(candidate: candidate)),
    );
  }
}
