import 'package:flutter/material.dart';
import 'package:cmbt/ui/views/live/web_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import 'live_viewmodel.dart';

class LiveView extends StatelessWidget {
  final String traccarURI = 'http://live.tourofcrete.gr:8080/?locale=en&token=X3TKrvKtjZKZwF3OT3ehWM6sdKUkTdTT';
  final String rankingURI = 'https://live.tourofcrete.gr/ranking/standings.php';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LiveViewModel>.nonReactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: _buildBoby(model),
        ),
      ),
      viewModelBuilder: () => LiveViewModel(),
    );
  }

  Widget _buildBoby(LiveViewModel model) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(
              'assets/waterfall_soft_black.jpg',
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Live race monitoring'),
            leading: IconButton(
              icon: Image.asset('assets/cmbt.png'),
              onPressed: () {},
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 100),
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
                              // Route route = MaterialPageRoute(
                              //   builder: (context) => WebScreen(
                              //     url: traccarURI,
                              //     title: 'Live View',
                              //   ),
                              // );
                              // //Navigator.push(context, route);
                              // mainNavigatorKey.currentState.push(route);
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
                              // Route route = MaterialPageRoute(
                              //   builder: (context) => WebScreen(
                              //     url: rankingURI,
                              //     title: 'Rankings',
                              //   ),
                              // );
                              // //Navigator.push(context, route);
                              // mainNavigatorKey.currentState.push(route);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/vodafone.png'),
                        iconSize: 100,
                        onPressed: () => model.launchExternalBrowser('https://www.vodafone.gr/'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// _launchURL(url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
