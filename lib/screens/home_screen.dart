import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
          appBar: AppBarWithHeight(
            height: 100.0,
          ),
          body: Center(
            child: Container(
              alignment: Alignment.center,
              child: Text('pappapapapa'),
            ),
          ),
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
