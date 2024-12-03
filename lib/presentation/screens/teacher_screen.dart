import 'package:cronograma_frontend/data/models/professor_model.dart';
import 'package:cronograma_frontend/presentation/screens/new_teacher_screen.dart';
import 'package:cronograma_frontend/presentation/viewmodels/professor_viewmodel.dart';
import 'package:flutter/material.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<ProfessorModel>>(
          future: ProfessorViewmodel.fetchProfessor(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print('Erro: ${snapshot.error}');
              return const Center(child: Text('Ocorreu um erro, tente novamente!'));
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
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navega para a tela de cadastro de professores
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CadastroProfessorScreen()),
            );
          },
          child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Colors.blue[800],
        ));
  }
}
