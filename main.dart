
import 'package:flutter/material.dart';
import './homePage.dart';
import './testHardware.dart';
import './managePlants.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PlantAppTM",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}


class HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage2(),
    PlantList(),
    TestHardware(),
    Text('Item 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: _pageOptions[_selectedPage],

      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
          });

        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.green,
        items:[

          new BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            title: new Text('Home'),
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.fiber_new),
            title: new Text('My plants'),
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.invert_colors_off),
            title: new Text('Test'),
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            title: new Text('Other'),
          )
        ],

      ),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  HomePageState createState () => HomePageState();
}
