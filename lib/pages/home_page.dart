import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String question = '¿El hombre llegó a la luna?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
            'Quizz App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            )

          ),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          SizedBox(height: 20),
          // Botón para "Verdadero"
          SizedBox(
            width: double.infinity, 
            child: ElevatedButton(
              onPressed: () {
                // Acción para respuesta "Verdadero"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // color del botón corregido
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Esquinas ligeramente redondeadas
                ),
              ),
              child: Text(
                'Verdadero',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Botón para "Falso"
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Acción para respuesta "Falso"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // color del botón corregido
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Esquinas ligeramente redondeadas
                ),
              ),
              child: Text(
                'Falso',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Indicador de respuesta
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(width: 5),
              Icon(Icons.close, color: Colors.red, size: 30),
            ],
          ),
        ],
      ),
    );
  }
}
