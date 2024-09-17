// hotel_list_screen.dart
import 'package:flutter/material.dart';
import 'package:viajesitos_application_1/models/hotel.dart';
import 'package:viajesitos_application_1/screens/hotelcard_screen.dart';

class HotelReservation extends StatefulWidget {
  const HotelReservation({super.key});

  @override
  _HotelReservationState createState() => _HotelReservationState();
}

class _HotelReservationState extends State<HotelReservation> {
  final Map<String, HotelReservationItem> _selectedItems = {};

  void _handleSelectItem(Hotel hotel) {
    setState(() {
      if (_selectedItems.containsKey(hotel.name)) {
        _selectedItems[hotel.name]!.quantity += 1;
      } else {
        _selectedItems[hotel.name] = HotelReservationItem(
          hotel: hotel,
          quantity: 1,
        );
      }
    });
  }

  void _handleRemoveItem(Hotel hotel) {
    setState(() {
      if (_selectedItems.containsKey(hotel.name)) {
        _selectedItems[hotel.name]!.quantity -= 1;
        if (_selectedItems[hotel.name]!.quantity == 0) {
          _selectedItems.remove(hotel.name);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Reservation'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: Hotel.length,
              itemBuilder: (context, index) {
                Hotel hotel = Hotel.fromJson(hotels[index]);
                return Card(
                  child: Column(
                    children: [
                      Text(hotel.name),
                      Text('Precio: \$${hotel.price}'),
                      Text('Disponibilidad: ${hotel.availability}'),
                      ElevatedButton(
                        onPressed: () => _handleSelectItem(hotel),
                        child: const Text('Reservar'),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text('Reservas seleccionadas:'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _selectedItems.length,
              itemBuilder: (context, index) {
                String hotelName = _selectedItems.keys.elementAt(index);
                HotelReservationItem hotelReservationItem = _selectedItems[hotelName]!;
                return Card(
                  child: Column(
                    children: [
                      Text(hotelName),
                      Text('Cantidad: ${hotelReservationItem.quantity}'),
                      Text('Precio total: \$${hotelReservationItem.hotel.price * hotelReservationItem.quantity}'),
                      ElevatedButton(
                        onPressed: () => _handleRemoveItem(hotelReservationItem.hotel),
                        child: const Text('-'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HotelReservationItem {
  Hotel hotel;
  int quantity;

  HotelReservationItem({required this.hotel, required this.quantity});
}

List<Map<String, dynamic>> hotels = [
  {
    'name': 'Hotel 1',
    'price': 100.0,
    'availability': 10,
  },
  {
    'name': 'Hotel 2',
    'price': 200.0,
    'availability': 20,
  },
  {
    'name': 'Hotel 3',
    'price': 300.0,
    'availability': 30,
  },
];

class Hotel {
  final String name;
  final double price;
  final int availability;

  static var length;

  Hotel({required this.name, required this.price, required this.availability});

  static fromJson(Map<String, dynamic> hotel) {
    return Hotel(
      name: hotel['name'],
      price: hotel['price'],
      availability: hotel['availability'],
    );
  }
}