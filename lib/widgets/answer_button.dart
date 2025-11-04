import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.optionKey, // Kunci opsi (A, B, C, D)
    required this.optionText, // Teks opsi (RAM, CPU, dll)
    required this.onPressed,
    this.buttonColor, // Tambahkan properti warna opsional
  });

  final String optionKey;
  final String optionText;
  final VoidCallback onPressed;
  final Color? buttonColor; // Warna tombol

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? Colors.blue, // Warna default jika tidak diberikan
        foregroundColor: Colors.black, // Warna teks
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Sudut melengkung (seperti desain)
          side: const BorderSide(color: Colors.black, width: 2), // Garis tepi hitam
        ),
        elevation: 5, // Sedikit bayangan
      ),
      child: Text(
        '$optionKey. $optionText', // Tampilkan "A. RAM"
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}