import 'package:flutter/material.dart';
import 'pedidos_screen.dart';
import 'package:restaurante_reserva/screens/comentarios_screen.dart'; // Importa la pantalla de comentarios

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PedidosScreen(),  // Navega a la pantalla de pedidos
                  ),
                );
              },
              child: Text('Ver Pedidos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComentariosScreen(),  // Navega a la pantalla de comentarios
                  ),
                );
              },
              child: Text('Comentarios y Likes'),
            ),
          ],
        ),
      ),
    );
  }
}
