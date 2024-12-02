import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cronograma'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Bem-vindo ao Cronograma!'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[400],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_rounded),
            label: 'Cronogramas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_reaction_rounded),
            label: 'Professores',
          ),
        ],
      ),
    );
  }
}
