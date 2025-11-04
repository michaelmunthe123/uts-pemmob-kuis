import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan MediaQuery untuk mendapatkan ukuran layar (Kriteria #6)
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribusi ruang secara merata
          children: [
            // Lingkaran Biru Besar dengan Teks (Kriteria #4 & #6)
            Container(
              width: screenSize.width * 0.7, // 70% lebar layar
              height: screenSize.width * 0.7, // Lingkaran sempurna
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent, // Warna biru
                shape: BoxShape.circle, // Bentuk lingkaran
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'WELCOME TO',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Warna teks hitam
                      ),
                    ),
                    Text(
                      'QUIZZ',
                      style: TextStyle(
                        fontSize: 36, // Ukuran lebih besar
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Tombol START
            SizedBox(
              width: screenSize.width * 0.6, // Lebar tombol 60% layar
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/input_name');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Warna abu-abu terang
                  foregroundColor: Colors.black, // Warna teks hitam
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Sedikit melengkung
                  ),
                  elevation: 5, // Sedikit bayangan
                ),
                child: const Text(
                  'START',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}