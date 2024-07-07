import 'package:flutter/material.dart';
import 'package:restaurante_reserva/models/Restaurante.dart';

class ConfirmationScreen extends StatelessWidget {
  final List<Restaurante> reservaciones;

  const ConfirmationScreen({Key? key, required this.reservaciones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: reservaciones.length,
          itemBuilder: (context, index) {
            final reserva = reservaciones[index];
            return Card(
              color: const Color.fromARGB(255, 173, 234, 248), // Agregar color de fondo
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Aumentar el padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Restaurante:      ${reserva.restaurante}', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0), // Agregar espacio entre elementos
                    Text('Tipo de Mesa:     ${reserva.tipomesa}'),
                    SizedBox(height: 8.0),
                    Text('Precio:                 \S/${reserva.precio} soles'),
                    SizedBox(height: 8.0),
                    Text('Hora:                    ${reserva.hora}'),
                    SizedBox(height: 8.0),
                    Text('Fecha:                  ${reserva.fecha}'),
                    SizedBox(height: 8.0),
                    Text('Nombre:               ${reserva.nombre} ${reserva.apellido}'),
                    SizedBox(height: 8.0),
                    Text('Celular:                 ${reserva.celular}'),
                    SizedBox(height: 8.0),
                    Text('Correo:                 ${reserva.correo}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}