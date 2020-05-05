import 'package:cmbt/contacts_widget.dart';
import 'package:cmbt/cyclists_monitoring_widget.dart';
import 'package:cmbt/news_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(CmbtApp());

class CmbtApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CMBT',
      theme: ThemeData(
        //primarySwatch: Colors.orange,
        brightness: Brightness.dark,

        //primaryTextTheme: TextTheme(
        //  title: TextStyle(color: Colors.white),
        //),
      ),
      home: HomePage(title: 'Cretan Mountain Bike Trails'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  final _pageOptions = [
    CyclistsMonitoringWidget(),
    NewsWidget(),
    ContactsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWithHeight(
          height: 100.0,
        ),

        body: Container(
          alignment: Alignment.center,
          child: _pageOptions[_selectedTab],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          iconSize: 36.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey[800],
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Monitoring'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Cmbt News'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Contact'),
            ),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class AppBarWithHeight extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const AppBarWithHeight({Key key, @required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[800],
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/cmbt.png',
            fit: BoxFit.contain,
            height: 90,
          ),
          Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cretan Mountain Bike Trails',
                style: TextStyle(fontSize: 17.0),
              ))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
