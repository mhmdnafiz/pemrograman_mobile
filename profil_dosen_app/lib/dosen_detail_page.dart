import 'package:flutter/material.dart';
import 'dosen_model.dart';

class DosenDetailPage extends StatelessWidget {
  final Dosen dosen;

  const DosenDetailPage({Key? key, required this.dosen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Dosen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan foto
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[700]!, Colors.blue[500]!],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      color: Colors.blue[100],
                      image: DecorationImage(
                        image: AssetImage(dosen.foto),
                        fit: BoxFit.cover,
                      ),
                    ),
                   
                  ),
                  SizedBox(height: 16),
                  Text(
                    dosen.nama,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    dosen.jabatan,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            
            // Informasi detail
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Informasi pribadi
                  _buildInfoCard(
                    title: 'Informasi Pribadi',
                    children: [
                      _buildInfoItem('NIP', dosen.nip),
                      _buildInfoItem('Email', dosen.email),
                      _buildInfoItem('Bidang Keahlian', dosen.bidang),
                      _buildInfoItem('Pendidikan', dosen.pendidikan),
                    ],
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Deskripsi
                  _buildInfoCard(
                    title: 'Tentang Dosen',
                    children: [
                      Text(
                        dosen.deskripsi,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Mata kuliah
                  _buildInfoCard(
                    title: 'Mata Kuliah yang Diampu',
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: dosen.mataKuliah.map((mk) {
                          return Chip(
                            label: Text(
                              mk,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            backgroundColor: Colors.blue[600],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required List<Widget> children}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
            SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}