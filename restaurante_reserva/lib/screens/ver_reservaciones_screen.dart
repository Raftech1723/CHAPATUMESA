import 'package:flutter/material.dart';
import 'package:restaurante_reserva/models/database_helper.dart';
import 'package:restaurante_reserva/models/Restaurante.dart';

class VerReservacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Reservaciones'),
      ),
      body: FutureBuilder<List<Restaurante>>(
        future: DatabaseHelper().getReservaciones(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay reservaciones'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final reservacion = snapshot.data![index];
                return ListTile(
                  title: Text(reservacion.restaurante),
                  subtitle: Text('Nombre: ${reservacion.nombre} - Mesa: ${reservacion.tipomesa} - Celular: ${reservacion.celular} - Correo: ${reservacion.correo} - Fecha: ${reservacion.fecha} -Hora: ${reservacion.hora}' ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
