import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          //Home
        BottomNavigationBarItem(
          icon: Icon(Icons.home,size:30),
        label:'Home'),
        ///Search
        BottomNavigationBarItem(
          icon: Icon(Icons.search,size: 30),
          label: 'Search'
          ),
        BottomNavigationBarItem(
          icon: CustomerIcon(),
          label: ' ',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message,size: 30),
          label: 'Message',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.person,size: 30),
          label: 'Profile',
          ),
      ],
      ),

      body: Center(child: Text('Home')),
    );
  }
}
