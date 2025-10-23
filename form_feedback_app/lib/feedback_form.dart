import 'package:flutter/material.dart';
import 'feedback_result.dart';

class FeedbackFormPage extends StatefulWidget {
  @override
  _FeedbackFormPageState createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final _formKey = GlobalKey<FormState>();
  
  String _name = '';
  String _comment = '';
  int _rating = 3;
  
  final List<String> _ratingLabels = [
    'Sangat Buruk',
    'Buruk',
    'Cukup',
    'Baik',
    'Sangat Baik'
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeedbackResultPage(
            name: _name,
            comment: _comment,
            rating: _rating,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Feedback'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Input Nama
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan nama Anda';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              
              SizedBox(height: 20),
              
              // Input Komentar
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Komentar',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan komentar Anda';
                  }
                  if (value.length < 10) {
                    return 'Komentar minimal 10 karakter';
                  }
                  return null;
                },
                onSaved: (value) {
                  _comment = value!;
                },
              ),
              
              SizedBox(height: 20),
              
              // Input Rating
              Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rating: $_rating/5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _ratingLabels[_rating - 1],
                        style: TextStyle(
                          color: _getRatingColor(_rating),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12),
                      Slider(
                        value: _rating.toDouble(),
                        min: 1,
                        max: 5,
                        divisions: 4,
                        label: _ratingLabels[_rating - 1],
                        onChanged: (value) {
                          setState(() {
                            _rating = value.round();
                          });
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index < _rating 
                                ? Colors.amber 
                                : Colors.grey[300],
                            size: 24,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 30),
              
              // Tombol Submit
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Kirim Feedback',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Color _getRatingColor(int rating) {
    switch (rating) {
      case 1: return Colors.red;
      case 2: return Colors.orange;
      case 3: return Colors.yellow[700]!;
      case 4: return Colors.lightGreen;
      case 5: return Colors.green;
      default: return Colors.grey;
    }
  }
}