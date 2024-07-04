import 'package:flutter/material.dart';

class ComentariosScreen extends StatefulWidget {
  @override
  _ComentariosScreenState createState() => _ComentariosScreenState();
}

class _ComentariosScreenState extends State<ComentariosScreen> {
  List<String> comentarios = [];
  String nuevoComentario = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comentarios'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: comentarios.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(comentarios[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {
                        // Aquí puedes manejar los "me gusta"
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  nuevoComentario = value;
                },
                decoration: InputDecoration(
                  labelText: 'Agregar Comentario',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        comentarios.add(nuevoComentario);
                        nuevoComentario = '';
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
