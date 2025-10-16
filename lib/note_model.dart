/// Merepresentasikan model data untuk sebuah catatan tunggal.
class Note {
  final String title;
  final String content;
  final DateTime timestamp;

  /// Membuat sebuah objek [Note] baru.
  ///
  /// - @param title Judul utama dari catatan.
  /// - @param content Konten atau isi teks dari catatan.
  /// - @param timestamp Waktu saat catatan ini dibuat.
  Note({
    required this.title,
    required this.content,
    required this.timestamp,
  });
}