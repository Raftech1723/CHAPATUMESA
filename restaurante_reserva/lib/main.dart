import 'package:flutter/material.dart';

import 'package:restaurante_reserva/screens/home_screen.dart';
import 'package:restaurante_reserva/screens/menu_screen.dart';  // Importa las pantallas necesarias

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva de Restaurante',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/menu': (context) => MenuScreen(),  // Ruta para el menú principal
      },
    );
  }
}
