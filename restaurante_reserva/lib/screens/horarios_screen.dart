import 'package:flutter/material.dart';

class HorariosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horarios Disponibles'),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text('10:00 AM - 12:00 PM'),
              subtitle: Text('Disponible'),
            ),
            ListTile(
              title: Text('12:00 PM - 02:00 PM'),
              subtitle: Text('Ocupado'),
            ),
            ListTile(
              title: Text('02:00 PM - 04:00 PM'),
              subtitle: Text('Disponible'),
            ),
            // Agrega más horarios según sea necesario
          ],
        ),
      ),
    );
  }
}