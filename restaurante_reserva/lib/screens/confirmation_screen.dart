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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Restaurante: ${reserva.restaurante}'),
                    Text('Tipo de Mesa: ${reserva.tipomesa}'),
                    Text('Precio: \S/${reserva.precio} soles'),
                    Text('Hora: ${reserva.hora}'),
                    Text('Fecha: ${reserva.fecha}'),
                    Text('Nombre: ${reserva.nombre} ${reserva.apellido}'),
                    Text('Celular: ${reserva.celular}'),
                    Text('Correo: ${reserva.correo}'),
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
