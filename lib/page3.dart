import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/flutter.json',
              width: 200, 
              height: 200,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_in),
            label: 'ZoomIn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_out),
            label: 'ZoomOut',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.yard_outlined),
            label: 'Yard',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
