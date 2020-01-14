import 'package:flutter/material.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const bodyViews = <Widget>[
  Text(
    'Index 0: 主页',
    style: optionStyle,
  ),
  Text(
    'Index 1: 词条',
    style: optionStyle,
  ),
];

class NavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationBar();
}

class _NavigationBar extends State<NavigationBar> {
  int _selectedIndex = 0;

  _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: bodyViews.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('主页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('词条'),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
