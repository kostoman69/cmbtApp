import 'package:cmbt/screens/gallery_screen.dart';
import 'package:cmbt/screens/home_screen.dart';
import 'package:cmbt/screens/live_screen.dart';
import 'package:cmbt/screens/location_screen.dart';
import 'package:cmbt/screens/news_screen.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
    BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.home), title: Text('home')),
    BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.route), title: Text('live')),
    BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.newspaper), title: Text('News')),
    BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.images), title: Text('Gallery')),
    BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.mapMarkedAlt), title: Text('Location')),
  ];

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        scaffold: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: _items,
          ),
          
        ),
        children: <Widget>[
          HomeScreen(),
          LiveScreen(),
          NewsScreen(),
          GalleryScreen(),
          LocationScreen()
        ],

        // Called when one of the [items] is tapped.
        onItemTap: (index) {},
      ),
    );
  }
}
