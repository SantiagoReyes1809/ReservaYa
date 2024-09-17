// home_page.dart
import 'package:flutter/material.dart';
import 'package:viajesitos_application_1/screens/reservationlist_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bienvenido a ReservaYa tu aplicacion de confianza para la reserva de hoteles'),
          const SizedBox(height: 20), // Espacio entre el texto y las imágenes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                'https://picsum.photos/200/300', // Reemplaza con la URL de tu imagen
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://picsum.photos/200/301', // Reemplaza con la URL de tu imagen
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://picsum.photos/200/302', // Reemplaza con la URL de tu imagen
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(height: 20), // Espacio entre las imágenes y el botón
          ElevatedButton(
            onPressed: () {
              // Navigate to the reservation list screen when the button is pressed
              Navigator.pushNamed(context, '/reservationlist');
            },
            child: const Text('Ver Reservas'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the chat screen when the FAB is pressed
          Navigator.pushNamed(context, '/chat');
        },
        tooltip: 'Open Chat',
        child: const Icon(Icons.chat),
      ),
    );
  }
}