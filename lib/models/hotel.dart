// models/hotel.dart
import 'package:viajesitos_application_1/screens/reservationlist_screen.dart';

class Hotel {
  final String name;
  final double price;
  final int availability;

  Hotel({required this.name, required this.price, required this.availability});

  static fromJson(Map<String, dynamic> hotel) {
    return Hotel(
      name: hotel['name'],
      price: hotel['price'],
      availability: hotel['availability'],
    );
  }

  // Getter for the length of the hotels list
  static get length => hotels.length;
}