import 'package:flutter/material.dart';
import 'package:viajesitos_application_1/screens/chat_screen.dart';
import 'package:viajesitos_application_1/screens/homepage_screen.dart';
import 'package:viajesitos_application_1/screens/reservationlist_screen.dart'; // Add this import statement

const apiKey = "";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      title: 'ReservaYa',
      home:  HomePage(),
      routes: {
        //'/': (context) => HomePage(), 
        '/chat': (context) =>  ChatScreen(),
        '/reservationlist': (context) => HotelReservation(), // Add this route
      },
    );
  }
}