import 'package:flutter/material.dart';
import 'package:kuis/models/question.dart';
import 'package:kuis/widgets/answer_button.dart';

import '../models/question.dart';
import '../widgets/answer_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // 10 Pertanyaan Anda (Kriteria #8)
  final List<Question> _questions = [
    Question(
      text: 'Komponen utama dalam sistem komputer yang berfungsi mengolah data adalah…',
      options: {'A': 'RAM', 'B': 'CPU', 'C': 'Hard Disk', 'D': 'Monitor'},
      correctAnswerKey: 'B',
    ),
    Question(
      text: 'Perangkat lunak yang berfungsi sebagai penghubung antara perangkat keras dan pengguna adalah…',
      options: {'A': 'Microsoft Word', 'B': 'Aplikasi Browser', 'C': 'Sistem Operasi', 'D': 'Compiler'},
      correctAnswerKey: 'C',
    ),
    Question(
      text: 'Bahasa pemrograman tingkat tinggi berarti…',
      options: {'A': 'Bahasa yang sulit dipahami manusia', 'B': 'Bahasa yang mudah dipahami mesin', 'C': 'Bahasa yang dekat dengan bahasa manusia', 'D': 'Bahasa rakitan (assembly)'},
      correctAnswerKey: 'C',
    ),
    Question(
      text: 'Dalam struktur data, “stack” menggunakan prinsip…',
      options: {'A': 'FIFO', 'B': 'LILO', 'C': 'FILO / LIFO', 'D': 'Random Access'},
      correctAnswerKey: 'C',
    ),
    Question(
      text: 'Jaringan komputer yang mencakup area sangat luas disebut…',
      options: {'A': 'LAN', 'B': 'MAN', 'C': 'WAN', 'D': 'PAN'},
      correctAnswerKey: 'C',
    ),
    Question(
      text: 'Dalam basis data, SQL digunakan untuk…',
      options: {'A': 'Menggambar diagram sistem', 'B': 'Mengelola dan memanipulasi data', 'C': 'Menyusun algoritma', 'D': 'Membuat aplikasi'},
      correctAnswerKey: 'B',
    ),
    Question(
      text: 'Dalam algoritma, “looping” berarti…',
      options: {'A': 'Kondisi berhenti program', 'B': 'Perulangan instruksi tertentu', 'C': 'Pemilihan kondisi logika', 'D': 'Pengurutan data'},
      correctAnswerKey: 'B',
    ),
    Question(
      text: 'File berekstensi “.exe” menunjukkan bahwa file tersebut adalah…',
      options: {'A': 'File teks', 'B': 'File gambar', 'C': 'File eksekusi program', 'D': 'File kompresi'},
      correctAnswerKey: 'C',
    ),
    Question(
      text: 'Istilah “open source” berarti…',
      options: {'A': 'Perangkat lunak berbayar', 'B': 'Kode program tidak dapat dilihat', 'C': 'Kode sumber tersedia untuk umum', 'D': 'Hanya digunakan di Linux'},
      correctAnswerKey: 'C',
    ),
    Question(
      text: 'Dalam kecerdasan buatan (AI), “machine learning” adalah…',
      options: {'A': 'Mesin yang bekerja tanpa algoritma', 'B': 'Teknik agar mesin dapat belajar dari data', 'C': 'Sistem otomatis tanpa data', 'D': 'Perangkat keras pengolah data'},
      correctAnswerKey: 'B',
    ),
  ];

  int _questionIndex = 0;
  int _score = 0;
  String _userName = '';

  // State untuk feedback visual (Kriteria #7)
  bool _showFeedback = false;
  bool _isCorrect = false;
  String? _selectedOptionKey; // Untuk menandai opsi yang dipilih

  // List warna untuk setiap tombol, agar mirip desain Anda
  final List<Color> _buttonColors = [
    Colors.yellowAccent, // Jokowi
    Colors.cyan, // Prabowo
    Colors.pinkAccent, // SBY
    Colors.orange, // Mega
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_userName.isEmpty) { // Pastikan hanya diambil sekali
      _userName = ModalRoute.of(context)!.settings.arguments as String;
    }
  }

  void _answerQuestion(String selectedKey) {
    if (_showFeedback) return; // Jangan izinkan double klik

    setState(() {
      _selectedOptionKey = selectedKey;
      _isCorrect = (selectedKey == _questions[_questionIndex].correctAnswerKey);
      if (_isCorrect) {
        _score++;
      }
      _showFeedback = true; // Tampilkan feedback
    });

    // Tunggu 1.5 detik lalu pindah ke pertanyaan berikutnya
    Future.delayed(const Duration(milliseconds: 1500), () {
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    setState(() {
      _showFeedback = false; // Sembunyikan feedback
      _selectedOptionKey = null; // Reset pilihan
    });

    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    } else {
      // Kuis selesai, pindah ke halaman skor
      Navigator.pushReplacementNamed(
        context,
        '/score',
        arguments: {
          'name': _userName,
          'score': _score,
          'total': _questions.length,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_questionIndex];
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Hilangkan AppBar default agar sesuai desain
        toolbarHeight: 0, // Sembunyikan toolbar
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack( // Menggunakan Stack untuk overlay feedback (Kriteria #4)
        children: [
          Column(
            children: [
              // Bagian Atas Biru untuk Pertanyaan
              Container(
                width: double.infinity,
                height: screenSize.height * 0.4, // 40% tinggi layar
                color: Colors.lightBlueAccent, // Warna biru
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${_questionIndex + 1}-${_questions.length}', // 1-10
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          currentQuestion.text,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Bagian Bawah untuk Tombol Jawaban (2x2 Grid)
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: GridView.builder(

                shrinkWrap: true,

                // Ini mematikan fitur scroll (karena tidak perlu)
                physics: const NeverScrollableScrollPhysics(),

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: 20, // Jarak horizontal antar tombol
                  mainAxisSpacing: 20, // Jarak vertikal antar tombol
                  childAspectRatio: 2.0, // Rasio lebar/tinggi tombol
                ),
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  final optionKey = currentQuestion.options.keys.elementAt(index);
                  final optionText = currentQuestion.options[optionKey]!;
                  final Color buttonBgColor = _buttonColors[index % _buttonColors.length];
                  return AnswerButton(
                    optionKey: optionKey,
                    optionText: optionText,
                    onPressed: () => _answerQuestion(optionKey),
                    buttonColor: buttonBgColor,
                      );
                    },
                  ),
                ),
              ),
            ),
            ],
          ),
          // Feedback Overlay (OK/X)
          if (_showFeedback)
            Container(
              color: Colors.black54, // Overlay gelap (sesuai desain)
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _isCorrect
                        ? 'lib/assets/images/logo_benar.png'
                        : 'lib/assets/images/logo_salah.png',
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Background tombol OK
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}