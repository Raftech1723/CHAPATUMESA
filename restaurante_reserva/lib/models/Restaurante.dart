class Restaurante {
  final int? id;
  final String restaurante;
  final String tipomesa;
  final double precio;
  final String hora;
  final String fecha;
  final String nombre;
  final String apellido;
  final String celular;
  final String correo;

  Restaurante({
    this.id,
    required this.restaurante,
    required this.tipomesa,
    required this.precio,
    required this.hora,
    required this.fecha,
    required this.nombre,
    required this.apellido,
    required this.celular,
    required this.correo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'restaurante': restaurante,
      'tipomesa': tipomesa,
      'precio': precio,
      'hora': hora,
      'fecha': fecha,
      'nombre': nombre,
      'apellido': apellido,
      'celular': celular,
      'correo': correo,
    };
  }

  factory Restaurante.fromMap(Map<String, dynamic> map) {
    return Restaurante(
      id: map['id'],
      restaurante: map['restaurante'],
      tipomesa: map['tipomesa'],
      precio: map['precio'],
      hora: map['hora'],
      fecha: map['fecha'],
      nombre: map['nombre'],
      apellido: map['apellido'],
      celular: map['celular'],
      correo: map['correo'],
    );
  }

  @override
  String toString() {
    return 'Restaurante: $restaurante, Tipo de Mesa: $tipomesa, Precio: $precio, Hora: $hora, Fecha: $fecha, Nombre: $nombre, Apellido: $apellido, Celular: $celular, Correo: $correo';
  }
}