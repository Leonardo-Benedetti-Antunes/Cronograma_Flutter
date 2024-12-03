import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cronograma_frontend/data/models/professor_model.dart'; // Importe o seu ProfessorModel

class CadastroProfessorScreen extends StatefulWidget {
  @override
  _CadastroProfessorScreenState createState() =>
      _CadastroProfessorScreenState();
}

class _CadastroProfessorScreenState extends State<CadastroProfessorScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _mondayController = false;
  bool _tuesdayController = false;
  bool _wednesdayController = false;
  bool _thursdayController = false;
  bool _fridayController = false;

  Future<void> cadastrarProfessor() async {
    final name = _nameController.text;
    final description = _descriptionController.text;
    final monday = _mondayController;
    final tuesday = _tuesdayController;
    final wednesday = _wednesdayController;
    final thursday = _thursdayController;
    final friday = _fridayController;

    if (name.isNotEmpty) {
      ProfessorModel professor = ProfessorModel(
        id: 0,
        nome: name,
        descricao: description,
        ativo: true,
        segunda: monday,
        terca: tuesday,
        quarta: wednesday,
        quinta: thursday,
        sexta: friday,
      );

      final Map<String, dynamic> professorData = professor.toJson();

      try {
        final response = await http.post(
          Uri.parse("http://10.0.2.2:8080/professor"),
          headers: {"Content-Type": "application/json"},
          body: json.encode(professorData),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Professor $name cadastrado!')),
          );
          Navigator.pop(context); // Fecha a tela de cadastro após sucesso
        } else {
          throw Exception('Falha ao cadastrar professor');
        }
      } catch (e) {
        print('Erro: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo professor'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Checkbox(
                              value: _mondayController,
                              onChanged: (value) =>
                                  setState(() => _mondayController = value!)),
                          const Text("Segunda-feira",
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Checkbox(
                              value: _tuesdayController,
                              onChanged: (value) =>
                                  setState(() => _tuesdayController = value!)),
                          const Text("Terça-feira", textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Checkbox(
                              value: _wednesdayController,
                              onChanged: (value) => setState(
                                  () => _wednesdayController = value!)),
                          const Text("Quarta-feira",
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Checkbox(
                              value: _thursdayController,
                              onChanged: (value) =>
                                  setState(() => _thursdayController = value!)),
                          const Text("Quinta-feira",
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Checkbox(
                              value: _fridayController,
                              onChanged: (value) =>
                                  setState(() => _fridayController = value!)),
                          const Text("Sexta-feira", textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: FilledButton(
                    onPressed: cadastrarProfessor,
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
