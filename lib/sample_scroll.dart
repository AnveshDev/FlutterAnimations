import 'package:flutter/material.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Problem',
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}


class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> _children = [
    new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      key: PageStorageKey<int>(0),
      itemExtent: 20.0,
      itemBuilder: (BuildContext context, int index) {
        return new Text('tab1  $index');
      },
    ),
    new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      key: PageStorageKey<int>(1),
      itemExtent: 20.0,
      itemBuilder: (BuildContext context, int index) {
        return new Text('tab2  $index');
      },
    ),
    new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      key: PageStorageKey<int>(2),
      itemExtent: 20.0,
      itemBuilder: (BuildContext context, int index) {
        return new Text('tab3  $index');
      },
    ),

  ];

  @override
  Widget build(BuildContext context) {
    print('${bucket}');
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: PageStorage(bucket: bucket, child: _children[_currentIndex]), // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}