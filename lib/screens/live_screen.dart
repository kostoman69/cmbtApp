import 'package:flutter/material.dart';
import 'package:cmbt/screens/web_screen.dart';

import '../main.dart';

class LiveScreen extends StatelessWidget {
  final String traccarURI = 'http://live.tourofcrete.gr:8080/?locale=en&token=X3TKrvKtjZKZwF3OT3ehWM6sdKUkTdTT';
  final String rankingURI = 'https://live.tourofcrete.gr/ranking/standings.php';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
          appBar: AppBar(
            title: Text('Live race monitoring'),
            leading: IconButton(
            icon: Image.asset('assets/cmbt.png'), 
            onPressed: () { },
          ),
          ),
          body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/liveview.jpg'),
                iconSize: 160,
                onPressed: () => null,
              ),
              Positioned.fill(
                child: Material(
                  elevation: 16.0,
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      print('liveview!');
                      Route route = MaterialPageRoute(
                        builder: (context) => WebScreen(
                          url: traccarURI,
                          title: 'Live View',
                        ),
                      );
                      //Navigator.push(context, route);
                      mainNavigatorKey.currentState.push(route);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/liverankings.jpg'),
                iconSize: 170,
                onPressed: () => null,
              ),
              Positioned.fill(
                child: Material(
                  elevation: 16.0,
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      print('liveview!');
                      Route route = MaterialPageRoute(
                        builder: (context) => WebScreen(
                          url: rankingURI,
                          title: 'Rankings',
                        ),
                      );
                      //Navigator.push(context, route);
                      mainNavigatorKey.currentState.push(route);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.0),
          Row(
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/vodafone.png'),
                iconSize: 100,
                onPressed: () => null,
              ),
            ],
          ),
        ],
      ),
    ),
      ),
    );
    
    
    
    
    
  }
}
