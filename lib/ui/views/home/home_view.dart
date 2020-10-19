import 'package:animations/animations.dart';
import 'package:cmbt/ui/views/gallery/gallery_view.dart';
import 'package:cmbt/ui/views/location/location_view.dart';
import 'package:cmbt/ui/views/logo/logo_view.dart';
import 'package:cmbt/ui/views/news/new_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: getViewForIndex(model.currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: FaIcon(FontAwesomeIcons.home),
            ),
            BottomNavigationBarItem(
              title: Text('News'),
              icon: FaIcon(FontAwesomeIcons.newspaper),
            ),
            BottomNavigationBarItem(
              title: Text('Gallery'),
              icon: FaIcon(FontAwesomeIcons.images),
            ),
            BottomNavigationBarItem(
              title: Text('Location'),
              icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return LogoView();
      case 1:
        return NewsView();
      case 2:
        return GalleryView();
      case 3:
        return LocationView();
      default:
        return LogoView();
    }
  }
}
