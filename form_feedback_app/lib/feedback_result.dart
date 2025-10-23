import 'package:flutter/material.dart';

class FeedbackResultPage extends StatefulWidget {
  final String name;
  final String comment;
  final int rating;

  const FeedbackResultPage({
    Key? key,
    required this.name,
    required this.comment,
    required this.rating,
  }) : super(key: key);

  @override
  _FeedbackResultPageState createState() => _FeedbackResultPageState();
}

class _FeedbackResultPageState extends State<FeedbackResultPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Feedback'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Informasi Feedback
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 64,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Feedback Berhasil Dikirim!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Card Detail Feedback
            Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Feedback',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // Informasi Nama
                    _buildInfoRow('Nama', widget.name, Icons.person),
                    
                    SizedBox(height: 12),
                    
                    // Informasi Rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 8),
                        Text(
                          'Rating:',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '${widget.rating}/5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _getRatingColor(widget.rating),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _getRatingLabel(widget.rating),
                            style: TextStyle(
                              color: _getRatingColor(widget.rating),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 8),
                    
                    // Stars Visual
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: index < widget.rating 
                              ? Colors.amber 
                              : Colors.grey[300],
                          size: 20,
                        );
                      }),
                    ),
                    
                    SizedBox(height: 16),
                    
                    // Komentar dengan Expandable
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.comment, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(
                              'Komentar:',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                _isExpanded 
                                    ? Icons.expand_less 
                                    : Icons.expand_more,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        AnimatedCrossFade(
                          duration: Duration(milliseconds: 300),
                          crossFadeState: _isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          firstChild: Text(
                            widget.comment.length > 100
                                ? '${widget.comment.substring(0, 100)}...'
                                : widget.comment,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          secondChild: Text(widget.comment),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Card Summary
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Terima kasih atas feedback Anda!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Kami akan terus berusaha meningkatkan layanan kami.',
                      style: TextStyle(
                        color: Colors.blue[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Tombol Kembali
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Kembali ke Form'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey[600]),
        SizedBox(width: 8),
        Text(
          '$label:',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
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
  
  String _getRatingLabel(int rating) {
    switch (rating) {
      case 1: return 'Sangat Buruk';
      case 2: return 'Buruk';
      case 3: return 'Cukup';
      case 4: return 'Baik';
      case 5: return 'Sangat Baik';
      default: return '';
    }
  }
}