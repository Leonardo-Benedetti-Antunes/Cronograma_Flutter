import 'package:cronograma_frontend/core/providers/navigation_provider.dart';
import 'package:cronograma_frontend/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'schedule_screen.dart';
import 'teacher_screen.dart';
import 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
          switch (navigationProvider.selectedIndex) {
            case 1:
              return ScheduleScreen();
            case 2:
              return TeacherScreen();
            default:
              return const HomeScreenBody();
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedPage: context.watch<NavigationProvider>().selectedIndex,
        onItemTapped: (index) {
          context.read<NavigationProvider>().setIndex(index);
        },
      ),
    );
  }
}
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 100, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            'Bem-vindo à tela inicial!',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
