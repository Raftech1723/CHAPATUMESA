import 'package:flutter/material.dart';
import 'package:restaurante_reserva/models/Restaurante.dart';
import 'confirmation_screen.dart';
import 'package:flutter/services.dart'; // Importar para la validación de celular
import 'package:restaurante_reserva/models/database_helper.dart'; // Importación correcta

class ReservacionesScreen extends StatefulWidget {
  @override
  _ReservacionesScreenState createState() => _ReservacionesScreenState();
}

class _ReservacionesScreenState extends State<ReservacionesScreen> {
  String _selectedRestaurante = '';
  String _selectedMesa = '';
  double _precioMesa = 0.0;
  String _horaReserva = '';
  String _fechaReserva = '';
  String _nombreCliente = '';
  String _apellidoCliente = '';
  String _celularCliente = '';
  String _correoCliente = '';

  List<Restaurante> reservaciones = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservación de Mesa'),
      ),
      body: Center(
        child: Container(
          width: 350.0,
          height: 650,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 132, 246, 206),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Nombre',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el nombre';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nombreCliente = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Apellido',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Apellido'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el apellido';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _apellidoCliente = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Celular',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Celular'),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length != 9) {
                        return 'Por favor ingresa un celular válido de 9 dígitos';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _celularCliente = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Correo',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Correo'),
                    validator: (value) {
                      if (value == null || value.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Por favor ingresa un correo válido';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _correoCliente = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Restaurante',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  CustomDropdown(
                    items: ['Maido', 'Mayta', 'Astrid & Gaston', 'Kjolle', 'Isolina'],
                    onChanged: (value) {
                      setState(() {
                        _selectedRestaurante = value!;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Tipo de Mesa',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  CustomDropdown(
                    items: [
                      'Para 2 personas',
                      'Para 4 personas',
                      'Para 6 personas',
                      'Para 8 personas',
                      'Para 10 a 20 personas'
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedMesa = value!;
                        _precioMesa = _getPrecioMesa(value);
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Precio',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\S$_precioMesa soles',
                    style: TextStyle(fontSize: 18.0, color: Colors.green),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Fecha de Reserva',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Fecha'),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _fechaReserva = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                        });
                      }
                    },
                    readOnly: true,
                    controller: TextEditingController(text: _fechaReserva),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Hora de Reserva',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Hora'),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          _horaReserva = "${pickedTime.hour}:${pickedTime.minute}";
                        });
                      }
                    },
                    readOnly: true,
                    controller: TextEditingController(text: _horaReserva),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Reservar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getPrecioMesa(String tipoMesa) {
    switch (tipoMesa) {
      case 'Para 2 personas':
        return 200.0;
      case 'Para 4 personas':
        return 400.0;
      case 'Para 6 personas':
        return 600.0;
      case 'Para 8 personas':
        return 800.0;
      case 'Para 10 a 20 personas':
        return 1000.0;
      default:
        return 0.0;
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final nuevaReserva = Restaurante(
        restaurante: _selectedRestaurante,
        tipomesa: _selectedMesa,
        precio: _precioMesa,
        nombre: _nombreCliente,
        apellido: _apellidoCliente,
        celular: _celularCliente,
        correo: _correoCliente,
        fecha: _fechaReserva,
        hora: _horaReserva,
      );

      await DatabaseHelper().insertReservacion(nuevaReserva);

      setState(() {
        reservaciones.add(nuevaReserva);
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationScreen(reservaciones: reservaciones),
        ),
      );
    }
  }
}

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final ValueChanged<String?> onChanged;

  CustomDropdown({required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? 'Por favor selecciona una opción' : null,
    );
  }
}

