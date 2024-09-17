// hotel_card.dart
import 'package:flutter/material.dart';
import 'package:viajesitos_application_1/models/hotel.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel, required Key });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(hotel.name),
          Text('Precio: \$${hotel.price}'),
          Text('Disponibilidad: ${hotel.availability}'),
          ElevatedButton(
            child: const Text('Reservar'),
            onPressed: () {
              // Lógica para crear una reserva para este hotel
            },
          ),
        ],
      ),
    );
  }
}

