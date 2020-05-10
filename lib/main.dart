import 'package:cmbt/screens/home_screen.dart';
import 'package:cmbt/screens/live_screen.dart';
import 'package:cmbt/screens/news_screen.dart';
import 'package:cmbt/screens/visitus_screen.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';

void main() => runApp(CmbtApp());

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class CmbtApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: mainNavigatorKey,
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
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
    BottomNavigationBarItem(icon: Icon(Icons.event), title: Text('live')),
    BottomNavigationBarItem(icon: Icon(Icons.save_alt), title: Text('News')),
    BottomNavigationBarItem(
        icon: Icon(Icons.save_alt), title: Text('Visit us')),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        scaffold: Scaffold(
          bottomNavigationBar:  BottomNavigationBar(
              items: _items,
            ),
        
        ),
        children: <Widget>[
          HomeScreen(),
          LiveScreen(),
          NewsScreen(),
          VisitUsScreen(),
        ],

        // Called when one of the [items] is tapped.
        onItemTap: (index) {},
      ),
    );
  }
}
