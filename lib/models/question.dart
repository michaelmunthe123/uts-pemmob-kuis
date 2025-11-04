class Question {
  final String text;
  final Map<String, String> options; // Menggunakan Map untuk opsi (A: "RAM", B: "CPU")
  final String correctAnswerKey; // Key dari jawaban yang benar (misal: "B")

  Question({
    required this.text,
    required this.options,
    required this.correctAnswerKey,
  });
}