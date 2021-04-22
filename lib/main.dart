import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/material_color.dart';
import 'package:instagram/screens/camera.dart';
import 'package:instagram/screens/feed_page.dart';
import 'package:instagram/screens/follow.dart';
import 'package:instagram/screens/profile.dart';
import 'package:instagram/screens/search.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      home: MainPage(),
      theme: ThemeData(
        primaryColor: white,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> _widgets = <Widget>[
    FeedPage(),
    Search(),
    Camera(),
    Follow(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[900],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) { 
          _onItemTapped(index);
        },
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(activeIconPath: 'assets/home_selected.png', iconPath: 'assets/home.png'),
          _buildBottomNavigationBarItem(activeIconPath: 'assets/search_selected.png', iconPath: 'assets/search.png'),
          _buildBottomNavigationBarItem(iconPath: 'assets/add.png'),
          _buildBottomNavigationBarItem(activeIconPath: 'assets/heart_selected.png', iconPath: 'assets/heart.png'),
          _buildBottomNavigationBarItem(activeIconPath: 'assets/profile_selected.png', iconPath: 'assets/profile.png'),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    if(index == 2) {
      openCamera(context);
    }
    else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({String activeIconPath, String iconPath}) {
    return BottomNavigationBarItem(
      activeIcon: activeIconPath == null ? null : ImageIcon(AssetImage(activeIconPath)),
      icon: ImageIcon(AssetImage(iconPath)),
      title: Text(''),
    );
  }

  void openCamera(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Camera()));
  }
}