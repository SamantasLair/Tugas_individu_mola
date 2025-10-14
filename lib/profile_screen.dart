import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFF312E2B),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 60.0, color: Colors.white),
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.black87),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              leading: const Icon(Icons.person, color: Colors.black54),
              title: const Text('Nama Pengguna',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Akademikos'),
              trailing: IconButton(
                icon: const Icon(Icons.edit, color: Colors.black54),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Statistik',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          _buildStatCard(
            'Catatan Dibuat',
            '58',
            Icons.article_outlined,
            Colors.orange,
          ),
          const SizedBox(height: 12),
          _buildStatCard(
            'Buku Diimpor',
            '12',
            Icons.file_download_outlined,
            Colors.green,
          ),
          const SizedBox(height: 12),
          _buildStatCard(
            'Buku Dibaca',
            '8',
            Icons.menu_book_outlined,
            Colors.lightBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color iconColor) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 32),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}