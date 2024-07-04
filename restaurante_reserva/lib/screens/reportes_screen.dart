import 'package:flutter/material.dart';

class ReportesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ganancias Obtenidas:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'S/. 10,000', // Aquí puedes añadir la lógica para calcular las ganancias
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}