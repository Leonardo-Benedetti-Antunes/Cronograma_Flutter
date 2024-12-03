import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedPage;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedPage,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedPage, // Usando o parâmetro correto aqui
      onTap: onItemTapped, // Chamando a função para alterar o índice
      unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
      fixedColor: Colors.white, // Cor do item selecionado
      unselectedItemColor: Colors.white, // Cor dos itens não selecionados
      backgroundColor: Colors.blue[800], // Cor de fundo
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard_customize_rounded,
            color: Colors.white,
          ),
          label: 'Cronogramas',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_reaction_rounded,
            color: Colors.white,
          ),
          label: 'Professores',
        ),
      ],
    );
  }
}
