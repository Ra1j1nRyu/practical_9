import 'package:flutter/material.dart';
import 'package:practice_9/profile_page.dart';
import 'package:practice_9/page3.dart'; 

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/profile', 
      routes: {
        '/profile': (context) => const ProfilePage(),
        '/page3': (context) => const Page3(),
      },
    ),
  );
}
