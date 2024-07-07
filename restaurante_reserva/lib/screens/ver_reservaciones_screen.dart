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
                return Card(
                  color: const Color.fromARGB(255, 173, 234, 248), // Agregar color de fondo
                  child: Padding(
                    padding: const EdgeInsets.all(30.0), // Aumentar el padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Restaurante:      ${reservacion.restaurante}', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 12.0), // Agregar espacio entre elementos
                        Text('Nombre:               ${reservacion.nombre} ${reservacion.apellido}'),
                        SizedBox(height: 8.0),
                        Text('Mesa:                   ${reservacion.tipomesa}'),
                        SizedBox(height: 8.0),
                        Text('Celular:                 ${reservacion.celular}'),
                        SizedBox(height: 8.0),
                        Text('Correo:                 ${reservacion.correo}'),
                        SizedBox(height: 8.0),
                        Text('Precio:                 \S/${reservacion.precio} soles'),
                        SizedBox(height: 8.0),
                        Text('Fecha:                  ${reservacion.fecha}'),
                        SizedBox(height: 8.0),
                        Text('Hora:                    ${reservacion.hora}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}