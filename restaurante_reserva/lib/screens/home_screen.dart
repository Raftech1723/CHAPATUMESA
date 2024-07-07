import 'package:flutter/material.dart';
import 'package:restaurante_reserva/screens/ver_reservaciones_screen.dart';

import 'horarios_screen.dart';
import 'reportes_screen.dart';
import 'reservaciones_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BIENVENIDO, CHAPATUMESA',
          style: TextStyle(color: Color.fromARGB(255, 192, 33, 33)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReservacionesScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: [
          _buildMenuItem(Icons.bar_chart, 'Reportes', Colors.blue, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportesScreen()),
            );
          }),
          _buildMenuItem(Icons.restaurant, 'Reservaciones', Colors.green, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VerReservacionesScreen()),
            );
          }),
          _buildMenuItem(Icons.card_giftcard, 'Canjear Cupones', Colors.orange, () {
            // Navegar a la pantalla de Canjear Cupones
          }),
          _buildMenuItem(Icons.schedule, 'Horarios', Colors.purple, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HorariosScreen()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(16.0),
              child: Icon(icon, size: 48.0, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(title, style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}