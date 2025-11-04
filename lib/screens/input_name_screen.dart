import 'package:flutter/material.dart';

class InputNameScreen extends StatefulWidget {
  const InputNameScreen({super.key});

  @override
  State<InputNameScreen> createState() => _InputNameScreenState();
}

class _InputNameScreenState extends State<InputNameScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _confirmName() {
    if (_nameController.text.isNotEmpty) {
      Navigator.pushReplacementNamed(
        context,
        '/quiz',
        arguments: _nameController.text,
      );
    } else {
      // Opsional: Tampilkan SnackBar atau dialog jika nama kosong
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nama tidak boleh kosong!'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'enter your name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Kolom Input Nama (Mirip desain)
              Container(
                width: screenSize.width * 0.7, // Lebar 70% layar
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent, // Latar belakang biru
                  borderRadius: BorderRadius.circular(10), // Sudut melengkung
                ),
                child: TextField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Warna teks input hitam
                  ),
                  decoration: const InputDecoration(
                    hintText: '...', // Placeholder 'Michael'
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54, // Warna placeholder agak pudar
                    ),
                    border: InputBorder.none, // Hilangkan border default
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Tombol Confirm
              SizedBox(
                width: screenSize.width * 0.6, // Lebar tombol 60% layar
                child: ElevatedButton(
                  onPressed: _confirmName,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'confirm',
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
      ),
    );
  }
}