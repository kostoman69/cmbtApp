import 'package:cmbt/app/router.gr.dart';
import 'package:cmbt/ui/views/home/home_view.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:stacked_services/stacked_services.dart';
import 'app/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      initialRoute: Routes.homeView,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}

// void main() => runApp(CmbtApp());

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

// class CmbtApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       navigatorKey: mainNavigatorKey,
//       title: 'CMBT',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//         brightness: Brightness.dark,

//         //primaryTextTheme: TextTheme(
//         //  title: TextStyle(color: Colors.white),
//         //),
//       ),
//       home: HomePage(title: 'Asterousia Trails'),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   HomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   final _items = [
//     BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.home), title: Text('Home')),
//     BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.route), title: Text('Live')),
//     BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.newspaper), title: Text('News')),
//     BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.images), title: Text('Gallery')),
//     BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.mapMarkedAlt), title: Text('Location')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: CustomScaffold(
//         scaffold: Scaffold(
//           bottomNavigationBar: BottomNavigationBar(
//             items: _items,
//           ),
//         ),
//         children: <Widget>[
//           HomeScreen(),
//           LiveScreen(),
//           NewsScreen(),
//           GalleryScreen(),
//           LocationScreen(),
//         ],

//         // Called when one of the [items] is tapped.
//         onItemTap: (index) {},
//       ),
//     );
//   }
// }
