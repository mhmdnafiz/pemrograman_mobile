import 'package:flutter/material.dart';
import 'dosen_model.dart';
import 'dosen_detail_page.dart';

class DosenListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Dosen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[50]!, Colors.white],
          ),
        ),
        child: ListView.builder(
          itemCount: dummyDosen.length,
          itemBuilder: (context, index) {
            final dosen = dummyDosen[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue[100],
                      image: DecorationImage(
                        image: AssetImage(dosen.foto),
                        fit: BoxFit.cover,
                      ),
                    ),
                
                  ),
                  title: Text(
                    dosen.nama,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        dosen.jabatan,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        dosen.bidang,
                        style: TextStyle(
                          color: Colors.blue[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue[700],
                    size: 16,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DosenDetailPage(dosen: dosen),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}