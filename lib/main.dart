import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/navigation_provider.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/schedule_screen.dart';
import 'presentation/screens/teacher_screen.dart';
import 'presentation/widgets/custom_bottom_navigation_bar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(), // Fornecendo o NavigationProvider
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // Tela inicial
    );
  }
}
