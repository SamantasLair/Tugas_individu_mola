import 'package:flutter/material.dart';
import 'home_screen.dart';

/// Halaman untuk autentikasi pengguna, baik melalui email atau media sosial.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ==================== State & Controller ====================

  /// Kunci global untuk mengelola state dan validasi Form.
  final _formKey = GlobalKey<FormState>();

  /// Mengontrol visibilitas teks pada field password.
  bool _obscureText = true;

  // ==================== Logic Methods ====================

  /// Memvalidasi input dan melakukan navigasi jika valid.
  void _submitLogin() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  // ==================== Build Method ====================
  // Metode utama yang merender seluruh UI halaman login.

  @override
  Widget build(BuildContext context) {
    // --- Definisi Warna Lokal ---
    const Color buttonBgColor = Colors.white;
    const Color borderColor = Color(0xFFE0E0E0);
    const Color darkTextColor = Color(0xFF312E2B);
    const Color lightGreyColor = Color(0xFFF5F5F5);

    return Scaffold(
      backgroundColor: lightGreyColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ---------- Logo Aplikasi ----------
                  Image.asset(
                    'assets/images/note_logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 48.0),

                  // ---------- Tombol Login Sosial ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialButton('assets/images/apple_logo.png', () {}),
                      _buildSocialButton('assets/images/google_logo.png', () {},
                          padding: const EdgeInsets.all(10.0)),
                      _buildSocialButton(
                          'assets/images/facebook_logo.png', () {}),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // ---------- Pemisah "OR" ----------
                  Row(
                    children: const [
                      Expanded(child: Divider(color: borderColor, thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('OR', style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(child: Divider(color: borderColor, thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // ---------- Form Input Email ----------
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: buttonBgColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            const BorderSide(color: darkTextColor, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // ---------- Form Input Password ----------
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: buttonBgColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            const BorderSide(color: darkTextColor, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Password wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),

                  // ---------- Tombol Sign In ----------
                  ElevatedButton(
                    onPressed: _submitLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkTextColor,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 0),
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Sign in',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // ---------- Tombol Lupa Password ----------
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style:
                          TextStyle(color: Colors.blue.shade700, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 32.0),

                  // ---------- Tautan ke Halaman Sign Up ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No account yet?',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==================== Helper Widgets ====================

  /// Membangun widget tombol untuk opsi login sosial agar kode tidak berulang.
  Widget _buildSocialButton(String imagePath, VoidCallback onPressed,
      {EdgeInsetsGeometry padding = const EdgeInsets.all(12.0)}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: padding,
            backgroundColor: Colors.white,
            side: const BorderSide(color: Color(0xFFE0E0E0)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Image.asset(imagePath, height: 28),
        ),
      ),
    );
  }
}