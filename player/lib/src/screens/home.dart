import 'package:flutter/material.dart';
import 'package:player/src/screens/data.dart';
import 'package:player/src/screens/thumbnails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Player')),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Thumbnail'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection), label: 'Post'),
        ],
        onTap: _onItemTapped,
        currentIndex: _index,
      ),
      body: _index == 0 ? Thumbnails.blocProvider() : Data.blocProvider(),
    );
  }
}
