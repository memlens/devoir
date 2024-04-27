import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as img;
import 'package:intl/intl.dart';
import 'candidate.dart';

class CandidateFormPage extends StatefulWidget {
  @override
  _CandidateFormPageState createState() => _CandidateFormPageState();
}

class _CandidateFormPageState extends State<CandidateFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _partyController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  img.XFile? _selectedImage;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire du candidat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Prénom'),
                controller: _firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prénom valide';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom'),
                controller: _lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom valide';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Parti'),
                controller: _partyController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un parti valide';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text('Sélectionner la date de naissance'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _selectImage();
                },
                child: Text('Sélectionner une photo'),
              ),
              if (_selectedDate != null)
                Text('Date de naissance: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}'),
              if (_selectedImage != null)
                Image.file(
                  File(_selectedImage!.path),
                  height: 200.0,
                  width: 200.0,
                ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final candidate = Candidate(
                        name: _firstNameController.text,
                        party: _partyController.text,
                        description: _descriptionController.text,
                        photoUrl: _selectedImage == null ? '' : _selectedImage!.path,
                        birthDate: _selectedDate,
                      );
                      Navigator.pop(context, candidate);
                    }
                  },
                  child: Text('Envoyer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectImage() async {
    final picker = img.ImagePicker();
    final img.XFile? pickedImage = await picker.pickImage(source: img.ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }
}
