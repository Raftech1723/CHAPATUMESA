import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PedidosScreen extends StatefulWidget {
  @override
  _PedidosScreenState createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  List<String> pedidos = [];

  @override
  void initState() {
    super.initState();
    _cargarPedidos();
  }

  // Método para cargar los pedidos desde el archivo
  Future<void> _cargarPedidos() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/reservas.txt');

      if (await file.exists()) {
        String reservasString = await file.readAsString();
        setState(() {
          pedidos = reservasString.split('\n');
        });
      }
    } catch (e) {
      print('Error al cargar pedidos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pedidos'),
      ),
      body: _buildBody(),
    );
  }

  // Método para construir el cuerpo de la pantalla
  Widget _buildBody() {
    if (pedidos.isEmpty) {
      return Center(
        child: Text('No hay pedidos registrados.'),
      );
    } else {
      return SingleChildScrollView(
        child: _buildPedidosTable(),
      );
    }
  }

  // Método para construir la tabla de pedidos
  Widget _buildPedidosTable() {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(), // Ajusta el ancho de la primera columna según el contenido
      },
      children: [
        for (var pedido in pedidos)
          _buildPedidoTableRow(pedido),
      ],
    );
  }

  // Método para construir una fila de pedido
  TableRow _buildPedidoTableRow(String pedido) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(pedido),
        ),
      ],
    );
  }
}
