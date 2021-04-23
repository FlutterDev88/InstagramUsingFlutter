import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}
 
class _CameraState extends State<Camera> {
  int _selectedIndex = 1;
  var _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: Icon(Icons.close), onPressed: () {Navigator.pop(context);}),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _galleryPage(),
          _photoPage(),
          _videoPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[50],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/grid.png')),
              title: Text('GALLERY')),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/grid.png')),
              title: Text('PHOTO')),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/grid.png')),
              title: Text('VIDEO')),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceIn,
    );
  }
 
  Widget _galleryPage() {
    return Container(
      color: Colors.red,
    );
  }
 
  Widget _photoPage() {
    return Container(
      color: Colors.green,
    );
  }
 
  Widget _videoPage() {
    return Container(
      color: Colors.yellow,
    );
  }
}