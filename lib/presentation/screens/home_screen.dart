import 'package:cronograma_frontend/data/models/professor_model.dart';
import 'package:cronograma_frontend/presentation/viewmodels/professor_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cronograma'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: FutureBuilder<List<ProfessorModel>>(
        future: ProfessorViewmodel.fetchProfessor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum professor encontrado'));
          } else {
            final professors = snapshot.data!;
            return ListView.builder(
              itemCount: professors.length,
              itemBuilder: (context, index) {
                final professor = professors[index];
                return ListTile(
                  title: Text(professor.nome),
                  subtitle: Text(professor.disponibilidade()),
                  trailing: Icon(
                    professor.ativo ? Icons.check_circle : Icons.cancel,
                    color: professor.ativo ? Colors.green : Colors.red,
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[800],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
