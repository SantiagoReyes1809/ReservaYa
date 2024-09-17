
import 'package:flutter/material.dart';
import 'package:viajesitos_application_1/screens/chat_screen.dart';
import 'package:viajesitos_application_1/screens/homepage_screen.dart';
import 'package:viajesitos_application_1/screens/reservationlist_screen.dart';

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
      home:  const HomePage(),
      routes: {
        //'/': (context) => HomePage(), 
        '/chat': (context) =>  ChatScreen(),
        '/reservationlist': (context) => const HotelReservation(), // Add this route
      },
    );
  }
}