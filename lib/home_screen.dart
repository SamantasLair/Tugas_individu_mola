import 'package:flutter/material.dart';
import 'note_model.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Note> _notes = [
    Note(
      title: 'Resep Nasi Goreng',
      content: 'Bawang merah, bawang putih, cabai, nasi, kecap...',
      timestamp: DateTime.now(),
    ),
    Note(
      title: 'Ide Proyek Flutter',
      content: 'Membuat aplikasi jurnal atau to-do list dengan Firebase.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Note(
      title: 'Catatan Meeting Kemarin',
      content: 'Membahas timeline proyek kuartal 4. Deadline diundur.',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Note(
      title: 'Daftar Belanja Bulanan',
      content: 'Sabun, sampo, sikat gigi, beras, minyak goreng.',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  final List<Color> _noteColors = [
    Colors.amber.shade200,
    Colors.lightGreen.shade200,
    Colors.lightBlue.shade200,
    Colors.orange.shade200,
    Colors.pink.shade200,
    Colors.tealAccent.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        title: const Text(
          'Jurnal Saya',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Akademikos",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("tutor.ai@google.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0, color: Colors.black87),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF312E2B),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Pengaturan'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _notes.isEmpty
          ? const Center(
              child: Text(
                'Belum ada catatan.\nTekan tombol + untuk memulai!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                final color = _noteColors[index % _noteColors.length];
                return Card(
                  color: color,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 1.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 18.0),
                    title: Text(
                      note.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        note.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF312E2B),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}