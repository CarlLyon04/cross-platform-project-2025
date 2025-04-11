import 'package:flutter/material.dart';
import 'package:my_figurines/screens/home.dart';
import 'package:my_figurines/services/notification_service.dart';

void main() async {
  // Ensures Flutter is fully initialized before doing async setup.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local notifications before app runs.
  await NotificationService.initialize();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Loads the home screen of the app.
      home: Home(),
    );
  }
}