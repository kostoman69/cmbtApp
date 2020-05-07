import 'package:cmbt/screens/web_screen.dart';
import 'package:flutter/material.dart';

class CyclistsMonitoringWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Image.asset('images/liveview.jpg'),
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
                          url: 'http://live.tourofcrete.gr:8080/?locale=en&token=WzGsIqGEdUdfARM6STgAMa6cExf5ZSpi',
                          title: 'Live View',
                        ),
                      );
                      Navigator.push(context, route);
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
                icon: Image.asset('images/liverankings.jpg'),
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
                          url: 'http://live.tourofcrete.gr/ranking/standings.php',
                          title: 'Rankings',
                        ),
                      );
                      Navigator.push(context, route);
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
                icon: Image.asset('images/vodafone.png'),
                iconSize: 100,
                onPressed: () => null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
