import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String name = args['name'];
    final int score = args['score'];
    final int total = args['total'];
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lingkaran Biru untuk Skor (Mirip WelcomeScreen)
            Container(
              width: screenSize.width * 0.7, // 70% lebar layar
              height: screenSize.width * 0.7, // Lingkaran sempurna
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2), // Border hitam
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'YOUR SCORE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '$score / $total',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'CONGRATULATION, $name !!!', // Tambahkan nama
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              '"A winner is a dreamer who never gives up"',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            // Tombol untuk kembali ke Home (jika diperlukan)
            SizedBox(
              width: screenSize.width * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Back to Home',
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