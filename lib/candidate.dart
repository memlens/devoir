class Candidate {
  String name;
  String party;
  String description;
  String photoUrl;
  DateTime? birthDate;

  Candidate({
    required this.name,
    required this.party,
    required this.description,
    required this.photoUrl,
    this.birthDate,
  });
}
